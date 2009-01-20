$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'user_agent'

class PrestoTest < Test::Unit::TestCase
  def test_opera_852_linux_as_ie_6
    ua = UserAgent.new "Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux i686; en) Opera 8.52"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :presto, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :opera, ua.name
    assert_equal "8.52", ua.complete_version
    assert_equal "8.52", ua.version
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

  def test_opera_854_win_xp
    ua = UserAgent.new "Opera/8.54 (Windows NT 5.1; U; pl)"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :presto, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :opera, ua.name
    assert_equal "8.54", ua.complete_version
    assert_equal "8.54", ua.version
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

  def test_opera_923_win_xp
    ua = UserAgent.new "Opera/9.23 (Windows NT 5.1; U; SV1; MEGAUPLOAD 1.0; ru)"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :presto, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :opera, ua.name
    assert_equal "9.23", ua.complete_version
    assert_equal "9.23", ua.version
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

  def test_opera_963_linux
    ua = UserAgent.new "Opera/9.63 (X11; Linux i686; U; de) Presto/2.1.1"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :presto, ua.render_engine
    assert_equal "2.1.1", ua.render_engine_version
    assert_equal :opera, ua.name
    assert_equal "9.63", ua.complete_version
    assert_equal "9.63", ua.version
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

  def test_opera_963_win_me_as_ie_6
    ua = UserAgent.new "Mozilla/5.0 (Windows ME; U; en; rv:1.8.1) Gecko/20061208 Firefox/2.0.0 Opera 9.63"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :presto, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :opera, ua.name
    assert_equal "9.63", ua.complete_version
    assert_equal "9.63", ua.version
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

  def test_opera_963_win_vista
    ua = UserAgent.new "Opera/9.63 (Windows NT 6.0; U; en) Presto/2.1.1"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :presto, ua.render_engine
    assert_equal "2.1.1", ua.render_engine_version
    assert_equal :opera, ua.name
    assert_equal "9.63", ua.complete_version
    assert_equal "9.63", ua.version
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

  def test_opera_963_win_vista_as_ie_6
    ua = UserAgent.new "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 6.0; ja) Opera 9.63"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :presto, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :opera, ua.name
    assert_equal "9.63", ua.complete_version
    assert_equal "9.63", ua.version
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
