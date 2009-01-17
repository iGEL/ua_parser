#!/usr/bin/env ruby

require "lib/user_agent"

raise "File tmp_log exists" if File.exist?("tmp_log")
Kernel.trap("SIGUSR1") do
  File.delete("tmp_log") if File.exists?("tmp_log")
  exit
end

gunzip = `which gunzip`.strip
bunzip = `which bunzip2`.strip

unknown = {}
errors = {}

files = Dir["logs/*access*"]
i = 0
known_count = 0
unknown_count = 0
total_count = 0
files.each do |filename|
  if i % 25 == 0 && i > 0
    $stderr.puts
    $stderr.puts "Parsed #{i} of #{files.size} files"
    $stderr.puts "#{errors.size} errors and #{unknown.size} unknown user agents"
    $stderr.puts "#{known_count} of #{total_count} hits (#{sprintf("%.3f", known_count/total_count.to_f * 100)}%) identified"
    $stderr.puts
  end
  i += 1
  org_name = filename
  if /\.gz$/ =~ filename
    if gunzip == ""
      $stderr.puts "SKIPPING #{filename}, gunzip not found"
      next
    end
    $stderr.puts "Decompressing #{filename}"
    system "#{gunzip} --stdout #{filename} > tmp_log"
    filename = "tmp_log"
  elsif /\.bz2$/ =~ filename
    if bunzip == ""
      $stderr.puts "SKIPPING #{filename}, bunzip2 not found"
      next
    end
    $stderr.puts "Decompressing #{filename}"
    raise "File tmp_log exists" if File.exist?("tmp_log")
    system "#{bunzip} --stdout #{filename} > tmp_log"
    filename = "tmp_log"
  end
  $stderr.puts "Parsing #{org_name}"
  File.open(filename) do |file|
    file.each_line do |line|
      ua_string = /"([^"]+)"$/.match(line)
      begin
        if ua_string && ua_string[1].strip != ""
          ua_string = ua_string[1].strip
          ua = UserAgent.new(ua_string)
          total_count += 1
          if ua.known?
            known_count += 1
          else
            unknown_count += 1
            if unknown.has_key?ua_string
              unknown[ua_string] += 1
            else
              unknown[ua_string] = 1
            end
          end
        end
      rescue RuntimeException => e
        if errors[ua_string]
          errors[ua_string][:count] += 1
        else
          errors[ua_string] = {:exception => e, :count => 1}
        end
      end
    end
  end
  File.delete("tmp_log") if filename == "tmp_log"
  break if errors.size > 100 || unknown.size > 5000
  GC.start
end

keys = unknown.keys.sort do |one, other|
  unknown[other] <=> unknown[one]
end
keys.each do |ua|
  puts "#{ua}: #{unknown[ua]}"
end
errors.each_key do |ua|
  puts "#{ua}: #{errors[ua][:exception].class}: #{errors[ua][:exception].message}"
  errors[ua][:exception].backtrace.each do |line|
    puts " #{line}"
  end
end
