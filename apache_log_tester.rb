#!/usr/bin/env ruby

require "lib/ua_parser"

def stats(stats)
  $stderr.puts
  $stderr.puts "Parsed #{stats[:parsed]} of #{stats[:files].size} files"
  $stderr.puts "#{stats[:unknown].size} unknown user agents, #{stats[:known].size} known and #{stats[:errors].size} errors"
  $stderr.puts "#{stats[:known_count]} of #{stats[:total_count]} hits (#{sprintf("%.3f", stats[:known_count]/stats[:total_count].to_f * 100)}%) identified"
  $stderr.puts
end

raise "File tmp_log exists" if File.exist?("tmp_log")
Kernel.trap("SIGUSR1") do
  File.delete("tmp_log") if File.exists?("tmp_log")
  exit
end

gunzip = `which gunzip`.strip
bunzip = `which bunzip2`.strip

unknown = {}
known = {}
errors = {}

files = Dir["logs/*access*"]
i = 0
known_count = 0
unknown_count = 0
total_count = 0

files.each do |filename|
  if i % 25 == 0 && i > 0
    stats(:parsed => i, :files => files, :unknown => unknown, :known => known, :errors => errors, :known_count => known_count, :total_count => total_count)
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
      match =  /\[([0-9]+)\/([a-z]+)\/([0-9]+):([0-9]+):([0-9]+):([0-9]+) .*\] .* "([^"]+)"\Z/i.match(line)
      begin
        if match && match[7].strip != "" && match[7].strip != "-"
          access = Time.mktime(match[3].to_i, {"Jan" => 1, "Feb" => 2, "Mar" => 3, "Apr" => 4, "May" => 5, "Jun" => 6, "Jul" => 7, "Aug" => 8, "Sep" => 9, "Oct" => 10, "Nov" => 11, "Dec" => 12}[match[2]], match[1].to_i, match[4].to_i, match[5].to_i, match[6].to_i)
          ua_string = match[7].strip
          ua = UaParser::UserAgent.new(ua_string)
          total_count += 1
          if ua.known?
            known_count += 1
            name = "#{ua.name}"
            name = "#{ua.name}/#{ua.version.major}" unless ua.version.nil?
            unless known.has_key?(name)
              known[name] = {:count => 0, :count_30d => 0, :regexps => 0, :last_access => Time.at(0), :first_seen => Time.now}
            end
            obj = known[name]
          else
            unknown_count += 1
            unless unknown.has_key?ua_string
              unknown[ua_string] = {:count => 0, :count_30d => 0, :guess => ua.type, :regexps => 0, :last_access => Time.at(0), :first_seen => Time.now}
            end
            obj = unknown[ua_string]
          end
          obj[:count] += 1
          obj[:regexps] += ua.regexps
          obj[:last_access] = access if access > obj[:last_access]
          obj[:first_seen] = access if access < obj[:first_seen]
          obj[:count_30d] += 1 if access > Time.now - 30 * 24 * 60 * 60
        end
      rescue RuntimeError => e
        if errors[ua_string]
          errors[ua_string][:count] += 1
        else
          errors[ua_string] = {:exception => e, :count => 1}
        end
      end
    end
  end
  File.delete("tmp_log") if filename == "tmp_log"
  break if errors.size > 100 || unknown.size > 5000 || known.size > 5000
  GC.start
end
stats(:parsed => i, :files => files, :unknown => unknown, :known => known, :errors => errors, :known_count => known_count, :total_count => total_count)

puts
puts "UNKNOWN USER AGENTS:"
puts "===================="
keys = unknown.keys.sort do |one, other|
  if unknown[other][:count_30d] == unknown[one][:count_30d]
    unknown[other][:count] <=> unknown[one][:count]
  else
    unknown[other][:count_30d] <=> unknown[one][:count_30d]
  end
end
keys.each do |ua|
  puts "#{ua}: #{unknown[ua][:count_30d]} hits in the last 30 days (Hits total: #{unknown[ua][:count]}, my guess: It's a #{unknown[ua][:guess]}, first seen: #{unknown[ua][:first_seen].strftime("%Y-%m-%d %H:%M:%S")}, last access: #{unknown[ua][:last_access].strftime("%Y-%m-%d %H:%M:%S")})"
end

puts
puts "KNOWN USER AGENTS:"
puts "=================="
keys = known.keys.sort do |one, other|
  if known[other][:count_30d] == known[one][:count_30d]
    known[other][:count] <=> known[one][:count]
  else
    known[other][:count_30d] <=> known[one][:count_30d]
  end
end
keys.each do |ua|
  puts "#{ua}: #{known[ua][:count_30d]} hits in the last 30 days (Hits total: #{known[ua][:count]}, regexps: #{sprintf("%.3f", known[ua][:regexps].to_f/known[ua][:count])}/hit, first seen: #{known[ua][:first_seen].strftime("%Y-%m-%d %H:%M:%S")}, last access: #{known[ua][:last_access].strftime("%Y-%m-%d %H:%M:%S")})"
end

puts
puts "ERROR CAUSING AGENTS:"
puts "====================="
errors.each_key do |ua|
  puts "#{ua}: #{errors[ua][:exception].class}: #{errors[ua][:exception].message}"
  errors[ua][:exception].backtrace.each do |line|
    puts " #{line}"
  end
end
