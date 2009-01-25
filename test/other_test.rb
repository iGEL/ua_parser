$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'ua_parser'

class OtherTest < Test::Unit::TestCase
  include UaParser
  
  def test_apache
    ua = UserAgent.new "Apache/2.2.8 (Ubuntu) DAV/2 SVN/1.4.6 mod_python/3.3.1 Python/2.5.2 PHP/5.2.4-2ubuntu5.3 with Suhosin-Patch mod_ssl/2.2.8 OpenSSL/0.9.8g (internal dummy connection)"
    assert ua.known?
    assert !ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :apache_httpd, ua.name
    assert_equal "2.2.8", ua.version.full
    assert_equal "2.2", ua.version.major
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal [], ua.urls
    assert_equal nil, ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_jakarta_commons_httpclient_3_1
    ua = UserAgent.new "Jakarta Commons-HttpClient/3.1"
    assert ua.known?
    assert !ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :jakarta_commons_httpclient, ua.name
    assert_equal "3.1", ua.version.full
    assert_equal "3.1", ua.version.major
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal [], ua.urls
    assert_equal nil, ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_java_1_6_0_03
    ua = UserAgent.new "Java/1.6.0_03"
    assert ua.known?
    assert !ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :java, ua.name
    assert_equal "1.6.0_03", ua.version.full
    assert_equal "1.6", ua.version.major
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal [], ua.urls
    assert_equal nil, ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_libwww_perl_5_805
    ua = UserAgent.new "libwww-perl/5.805"
    assert ua.known?
    assert !ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :"libwww-perl", ua.name
    assert_equal "5.805", ua.version.full
    assert_equal "5.805", ua.version.major
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal [], ua.urls
    assert_equal nil, ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_svn_151
    ua = UserAgent.new "SVN/1.5.1 (r32289) neon/0.28.2"
    assert ua.known?
    assert !ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :svn_client, ua.name
    assert_equal "1.5.1", ua.version.full
    assert_equal "1.5", ua.version.major
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal [], ua.urls
    assert_equal nil, ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_tortoise_svn_152
    ua = UserAgent.new "SVN/1.5.2 (r32768)/TortoiseSVN-1.5.3.13783 neon/0.28.3"
    assert ua.known?
    assert !ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :tortoisesvn, ua.name
    assert_equal "1.5.3.13783", ua.version.full
    assert_equal "1.5", ua.version.major
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal [], ua.urls
    assert_equal nil, ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end
end
