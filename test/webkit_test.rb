$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'user_agent'

class WebkitTest < Test::Unit::TestCase
  def test_chrome_031549_windows_7
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/525.19 (KHTML, like Gecko) Chrome/0.3.154.9 Safari/525.19"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :webkit, ua.render_engine
    assert_equal "525.19", ua.render_engine_version
    assert_equal :chrome, ua.name
    assert_equal "0.3.154.9", ua.complete_version
    assert_equal "0.3", ua.version
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

  def test_chrome_1015439_windows_xp
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.19 (KHTML, like Gecko) Chrome/1.0.154.39 Safari/525.19"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :webkit, ua.render_engine
    assert_equal "525.19", ua.render_engine_version
    assert_equal :chrome, ua.name
    assert_equal "1.0.154.39", ua.complete_version
    assert_equal "1.0", ua.version
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

  def test_chrome_201561_windows_7
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/528.8 (KHTML, like Gecko) Chrome/2.0.156.1 Safari/528.8"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :webkit, ua.render_engine
    assert_equal "528.8", ua.render_engine_version
    assert_equal :chrome, ua.name
    assert_equal "2.0.156.1", ua.complete_version
    assert_equal "2.0", ua.version
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

  def test_chrome_201572_windows_vista
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/528.10 (KHTML, like Gecko) Chrome/2.0.157.2 Safari/528.10"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :webkit, ua.render_engine
    assert_equal "528.10", ua.render_engine_version
    assert_equal :chrome, ua.name
    assert_equal "2.0.157.2", ua.complete_version
    assert_equal "2.0", ua.version
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

=begin
  def test_safari_132_mac_10_ppc
    ua = UserAgent.new "Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.6"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :webkit, ua.render_engine
    assert_equal "312.6", ua.render_engine_version
    assert_equal :safari, ua.name
    assert_equal "1.3.2", ua.complete_version
    assert_equal "1.3", ua.version
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

  def test_safari_202
    ua = UserAgent.new "Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/416.12 (KHTML, like Gecko) Safari/412.5"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :webkit, ua.render_engine
    assert_equal "412.5", ua.render_engine_version
    assert_equal :safari, ua.name
    assert_equal "2.0.2", ua.complete_version
    assert_equal "2.0", ua.version
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
=end
  
  def test_safari_32_mac_intel
    ua = UserAgent.new "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_5; ja-jp) AppleWebKit/525.26.2 (KHTML, like Gecko) Version/3.2 Safari/525.26.12"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :webkit, ua.render_engine
    assert_equal "525.26.2", ua.render_engine_version
    assert_equal :safari, ua.name
    assert_equal "3.2", ua.complete_version
    assert_equal "3.2", ua.version
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

  def test_safari_32_windows_xp
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Windows NT 5.1; ru-RU) AppleWebKit/525.26.2 (KHTML, like Gecko) Version/3.2 Safari/525.26.13"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :webkit, ua.render_engine
    assert_equal "525.26.2", ua.render_engine_version
    assert_equal :safari, ua.name
    assert_equal "3.2", ua.complete_version
    assert_equal "3.2", ua.version
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

  def test_safari_40_mac_ppc
    ua = UserAgent.new "Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; en) AppleWebKit/528.4+ (KHTML, like Gecko) Version/4.0 Safari/528.1"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :webkit, ua.render_engine
    assert_equal "528.4+", ua.render_engine_version
    assert_equal :safari, ua.name
    assert_equal "4.0", ua.complete_version
    assert_equal "4.0", ua.version
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

  def test_safari_40dp1_mac_10_intel
    ua = UserAgent.new "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-gb) AppleWebKit/528.10+ (KHTML, like Gecko) Version/4.0dp1 Safari/526.11.2"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :webkit, ua.render_engine
    assert_equal "528.10+", ua.render_engine_version
    assert_equal :safari, ua.name
    assert_equal "4.0dp1", ua.complete_version
    assert_equal "4.0dp1", ua.version
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
