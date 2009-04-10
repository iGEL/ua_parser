# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ua_parser}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Johannes Barre"]
  s.date = %q{2009-04-11}
  s.description = %q{Parses the user agent of browsers and bots.}
  s.email = %q{igel@igels.net}
  s.extra_rdoc_files = ["README.rdoc", "lib/ua_parser/version.rb", "lib/ua_parser/user_agent.rb", "lib/ua_parser.rb"]
  s.files = ["Manifest", "README.rdoc", "Rakefile", "test/trident_test.rb", "test/webkit_test.rb", "test/gecko_test.rb", "test/other_test.rb", "test/version_test.rb", "test/crawler_test.rb", "test/presto_test.rb", "apache_log_tester.rb", "ua_parser.gemspec", "lib/ua_parser/version.rb", "lib/ua_parser/user_agent.rb", "lib/ua_parser.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/iGEL/ua_parser}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Ua_parser", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ua_parser}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Parses the user agent of browsers and bots.}
  s.test_files = ["test/trident_test.rb", "test/webkit_test.rb", "test/gecko_test.rb", "test/other_test.rb", "test/version_test.rb", "test/crawler_test.rb", "test/presto_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
