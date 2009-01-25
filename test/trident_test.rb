$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'ua_parser'

class TridentTest < Test::Unit::TestCase
  include UaParser
  
  def test_msie_60_win_2003
    ua = UserAgent.new "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 1.1.4322)"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :trident, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :internet_explorer, ua.name
    assert_equal "6.0", ua.version.full
    assert_equal "6", ua.version.major
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

  def test_msie_60_win_xp
    ua = UserAgent.new "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :trident, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :internet_explorer, ua.name
    assert_equal "6.0", ua.version.full
    assert_equal "6", ua.version.major
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

  def test_msie_70_win_vista_dotnet_2050727_dotnet_3004506_media_center
    ua = UserAgent.new "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506)"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :trident, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :internet_explorer, ua.name
    assert_equal "7.0", ua.version.full
    assert_equal "7", ua.version.major
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

  def test_msie_70_win_xp_dotnet_114322
    ua = UserAgent.new "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322)"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :trident, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :internet_explorer, ua.name
    assert_equal "7.0", ua.version.full
    assert_equal "7", ua.version.major
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

  def test_msie_70_win_xp
    ua = UserAgent.new "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :trident, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :internet_explorer, ua.name
    assert_equal "7.0", ua.version.full
    assert_equal "7", ua.version.major
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

  def test_msie_80_win_xp
    ua = UserAgent.new "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0)"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :trident, ua.render_engine
    assert_equal "4.0", ua.render_engine_version.full
    assert_equal :internet_explorer, ua.name
    assert_equal "8.0", ua.version.full
    assert_equal "8", ua.version.major
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
