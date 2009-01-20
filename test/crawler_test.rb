$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'user_agent'

class CrawlerTest < Test::Unit::TestCase
  def test_baiduspider
    ua = UserAgent.new "Baiduspider+(+http://www.baidu.com/search/spider.htm)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :baiduspider, ua.name
    assert_equal nil, ua.complete_version
    assert_equal nil, ua.version
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://www.baidu.com/search/spider.htm"], ua.urls
    assert_equal "http://www.baidu.com/search/spider.htm", ua.url
    [:architecture, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_googlebot_21
    ua = UserAgent.new "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :googlebot, ua.name
    assert_equal "2.1", ua.complete_version
    assert_equal "2.1", ua.version
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://www.google.com/bot.html"], ua.urls
    assert_equal "http://www.google.com/bot.html", ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_msnbot_10
    ua = UserAgent.new "msnbot/1.0 (+http://search.msn.com/msnbot.htm)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :msnbot, ua.name
    assert_equal "1.0", ua.complete_version
    assert_equal "1.0", ua.version
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://search.msn.com/msnbot.htm"], ua.urls
    assert_equal "http://search.msn.com/msnbot.htm", ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_msnbot_11
    ua = UserAgent.new "msnbot/1.1 (+http://search.msn.com/msnbot.htm)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :msnbot, ua.name
    assert_equal "1.1", ua.complete_version
    assert_equal "1.1", ua.version
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://search.msn.com/msnbot.htm"], ua.urls
    assert_equal "http://search.msn.com/msnbot.htm", ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_msnbot_media_10
    ua = UserAgent.new "msnbot-media/1.0 (+http://search.msn.com/msnbot.htm)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :"msnbot-media", ua.name
    assert_equal "1.0", ua.complete_version
    assert_equal "1.0", ua.version
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://search.msn.com/msnbot.htm"], ua.urls
    assert_equal "http://search.msn.com/msnbot.htm", ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_msnbot_media_11
    ua = UserAgent.new "msnbot-media/1.1 (+http://search.msn.com/msnbot.htm)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :"msnbot-media", ua.name
    assert_equal "1.1", ua.complete_version
    assert_equal "1.1", ua.version
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://search.msn.com/msnbot.htm"], ua.urls
    assert_equal "http://search.msn.com/msnbot.htm", ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_cuil_twiceler_09
    ua = UserAgent.new "Mozilla/5.0 (Twiceler-0.9 http://www.cuil.com/twiceler/robot.html)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :"twiceler", ua.name
    assert_equal "0.9", ua.complete_version
    assert_equal "0.9", ua.version
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://www.cuil.com/twiceler/robot.html"], ua.urls
    assert_equal "http://www.cuil.com/twiceler/robot.html", ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_cuil_09_twiceler_wrong_domain
    ua = UserAgent.new "Mozilla/5.0 (Twiceler-0.9 http://www.cuill.com/twiceler/robot.html)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :"twiceler", ua.name
    assert_equal "0.9", ua.complete_version
    assert_equal "0.9", ua.version
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://www.cuill.com/twiceler/robot.html"], ua.urls
    assert_equal "http://www.cuill.com/twiceler/robot.html", ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_yahoo_slurp
    ua = UserAgent.new "Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :"yahoo! slurp", ua.name
    assert_equal nil, ua.complete_version
    assert_equal nil, ua.version
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://help.yahoo.com/help/us/ysearch/slurp"], ua.urls
    assert_equal "http://help.yahoo.com/help/us/ysearch/slurp", ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_yahoo_slurp_30
    ua = UserAgent.new "Mozilla/5.0 (compatible; Yahoo! Slurp/3.0; http://help.yahoo.com/help/us/ysearch/slurp)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :"yahoo! slurp", ua.name
    assert_equal "3.0", ua.complete_version
    assert_equal "3.0", ua.version
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://help.yahoo.com/help/us/ysearch/slurp"], ua.urls
    assert_equal "http://help.yahoo.com/help/us/ysearch/slurp", ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end
end
