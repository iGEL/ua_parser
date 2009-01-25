$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'ua_parser'

class CrawlerTest < Test::Unit::TestCase
  include UaParser
  
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

  def test_cuil_twiceler_0_9
    ua = UserAgent.new "Mozilla/5.0 (Twiceler-0.9 http://www.cuil.com/twiceler/robot.html)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :"twiceler", ua.name
    assert_equal "0.9", ua.version.full
    assert_equal "0.9", ua.version.major
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

  def test_cuil_0_9_twiceler_wrong_domain
    ua = UserAgent.new "Mozilla/5.0 (Twiceler-0.9 http://www.cuill.com/twiceler/robot.html)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :"twiceler", ua.name
    assert_equal "0.9", ua.version.major
    assert_equal "0.9", ua.version.full
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

  def test_gigabot_3_0
    ua = UserAgent.new "Gigabot/3.0 (http://www.gigablast.com/spider.html)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :gigabot, ua.name
    assert_equal "3.0", ua.version.full
    assert_equal "3.0", ua.version.major
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://www.gigablast.com/spider.html"], ua.urls
    assert_equal "http://www.gigablast.com/spider.html", ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_gonzo_1
    ua = UserAgent.new "gonzo1[P] +http://www.suchen.de/faq.html"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :gonzo, ua.name
    assert_equal "1", ua.version.full
    assert_equal "1", ua.version.major
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://www.suchen.de/faq.html"], ua.urls
    assert_equal "http://www.suchen.de/faq.html", ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end
  
  def test_gonzo_2
    ua = UserAgent.new "gonzo2[P] +http://www.suchen.de/faq.html"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :gonzo, ua.name
    assert_equal "2", ua.version.full
    assert_equal "2", ua.version.major
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://www.suchen.de/faq.html"], ua.urls
    assert_equal "http://www.suchen.de/faq.html", ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end
  
  def test_googlebot_2_1
    ua = UserAgent.new "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :googlebot, ua.name
    assert_equal "2.1", ua.version.full
    assert_equal "2.1", ua.version.major
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

  def test_googlebot_image_1_0
    ua = UserAgent.new "Googlebot-Image/1.0"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :"googlebot-image", ua.name
    assert_equal "1.0", ua.version.full
    assert_equal "1.0", ua.version.major
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

  def test_mediapartners_google
    ua = UserAgent.new "Mediapartners-Google"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :"mediapartners-google", ua.name
    assert_equal nil, ua.version
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

  def test_mediapartners_google_21
    ua = UserAgent.new "Mediapartners-Google/2.1"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :"mediapartners-google", ua.name
    assert_equal "2.1", ua.version.full
    assert_equal "2.1", ua.version.major
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

  def test_mj12bot_1_2_3
    ua = UserAgent.new "Mozilla/5.0 (compatible; MJ12bot/v1.2.3; http://www.majestic12.co.uk/bot.php?+)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :mj12bot, ua.name
    assert_equal "1.2.3", ua.version.full
    assert_equal "1.2", ua.version.major
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://www.majestic12.co.uk/bot.php?+"], ua.urls
    assert_equal "http://www.majestic12.co.uk/bot.php?+", ua.url
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
    assert_equal "1.0", ua.version.full
    assert_equal "1.0", ua.version.major
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
    assert_equal "1.1", ua.version.full
    assert_equal "1.1", ua.version.major
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
    assert_equal "1.0", ua.version.full
    assert_equal "1.0", ua.version.major
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
    assert_equal "1.1", ua.version.major
    assert_equal "1.1", ua.version.full
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

  def test_seekbot_1_0
    ua = UserAgent.new "Seekbot/1.0 (http://www.seekbot.net/bot.html) HTTPFetcher/2.2"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :seekbot, ua.name
    assert_equal "1.0", ua.version.major
    assert_equal "1.0", ua.version.full
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://www.seekbot.net/bot.html"], ua.urls
    assert_equal "http://www.seekbot.net/bot.html", ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_speedy_spider
    ua = UserAgent.new "Speedy Spider (http://www.entireweb.com/about/search_tech/speedy_spider/)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :"speedy spider", ua.name
    assert_equal nil, ua.version
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://www.entireweb.com/about/search_tech/speedy_spider/"], ua.urls
    assert_equal "http://www.entireweb.com/about/search_tech/speedy_spider/", ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_unknown_bot
    ua = UserAgent.new "iGELbot"
    assert !ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :unknown_bot, ua.name
    assert_equal nil, ua.version
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

  def test_unknown_bot_with_emails
    ua = UserAgent.new "iGELbot (a_sf-32@sub-dom3.x.de; +info@x.de"
    assert !ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :unknown_bot, ua.name
    assert_equal nil, ua.version
    assert_equal ["a_sf-32@sub-dom3.x.de", "info@x.de"], ua.emails
    assert_equal "a_sf-32@sub-dom3.x.de", ua.email
    assert_equal [], ua.urls
    assert_equal nil, ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_unknown_bot_with_urls
    ua = UserAgent.new "iGELbot (+http://xa2.a-z.43x.com:93/afzde.php?if=asdf&rm=3;x=hello+r%C3%BCdiger; www.heise.de)"
    assert !ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :unknown_bot, ua.name
    assert_equal nil, ua.version
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://xa2.a-z.43x.com:93/afzde.php?if=asdf&rm=3;x=hello+r%c3%bcdiger", "www.heise.de"], ua.urls
    assert_equal "http://xa2.a-z.43x.com:93/afzde.php?if=asdf&rm=3;x=hello+r%c3%bcdiger", ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_unknown_crawler
    ua = UserAgent.new "iGELcrawler"
    assert !ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :unknown_bot, ua.name
    assert_equal nil, ua.version
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

  def test_unknown_spider
    ua = UserAgent.new "iGELspider"
    assert !ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :unknown_bot, ua.name
    assert_equal nil, ua.version
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

  def test_yahoo_slurp_3_0
    ua = UserAgent.new "Mozilla/5.0 (compatible; Yahoo! Slurp/3.0; http://help.yahoo.com/help/us/ysearch/slurp)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :"yahoo! slurp", ua.name
    assert_equal "3.0", ua.version.full
    assert_equal "3.0", ua.version.major
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

  def test_yeti_0_01
    ua = UserAgent.new "Yeti/0.01 (nhn/1noon, yetibot@naver.com, check robots.txt daily and follow it)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :yeti, ua.name
    assert_equal "0.01", ua.version.full
    assert_equal "0.0", ua.version.major
    assert_equal ["yetibot@naver.com"], ua.emails
    assert_equal "yetibot@naver.com", ua.email
    assert_equal [], ua.urls
    assert_equal nil, ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_yeti_1_0
    ua = UserAgent.new "Yeti/1.0 (+http://help.naver.com/robots/)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :yeti, ua.name
    assert_equal "1.0", ua.version.full
    assert_equal "1.0", ua.version.major
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://help.naver.com/robots/"], ua.urls
    assert_equal "http://help.naver.com/robots/", ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end

  def test_yeti_1_0_with_company
    ua = UserAgent.new "Yeti/1.0 (NHN Corp.; http://help.naver.com/robots/)"
    assert ua.known?
    assert ua.bot?
    assert !ua.browser?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal nil, ua.render_engine
    assert_equal nil, ua.render_engine_version
    assert_equal :yeti, ua.name
    assert_equal "1.0", ua.version.full
    assert_equal "1.0", ua.version.major
    assert_equal [], ua.emails
    assert_equal nil, ua.email
    assert_equal ["http://help.naver.com/robots/"], ua.urls
    assert_equal "http://help.naver.com/robots/", ua.url
    [:architecture, :dotnet_versions, :os, :os_type, :os_version, :ui_lang, :ui_lang_country, :vendor].each do |method|
      assert_raise NotImplementedError do
        ua.method(method).call
      end
    end
  end
end
