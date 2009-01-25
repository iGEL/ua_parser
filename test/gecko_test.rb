$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'ua_parser'

class GeckoTest < Test::Unit::TestCase
  include UaParser
  
  def test_bon_echo_2_0_a3_win_xp
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1a3) Gecko/20060526 BonEcho/2.0a3"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.8.1a3", ua.render_engine_version.full
    assert_equal "1.8", ua.render_engine_version.major
    assert_equal :bonecho, ua.name
    assert_equal "2.0a3", ua.version.full
    assert_equal "2.0a", ua.version.major
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

  def test_bon_echo_2_0_0_4_linux_x86_64
    ua = UserAgent.new "Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US; rv:1.8.1.4) Gecko/20080721 BonEcho/2.0.0.4"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.8.1.4", ua.render_engine_version.full
    assert_equal :bonecho, ua.name
    assert_equal "2.0.0.4", ua.version.full
    assert_equal "2.0", ua.version.major
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

  def test_camino_155_mac_ppc
    ua = UserAgent.new "Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en; rv:1.8.1.12) Gecko/20080206 Camino/1.5.5"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.8.1.12", ua.render_engine_version.full
    assert_equal "1.8", ua.render_engine_version.major
    assert_equal :camino, ua.name
    assert_equal "1.5.5", ua.version.full
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

  def test_firefox_2006_linux_swiftfox
    ua = UserAgent.new "Mozilla/5.0 (X11; U; Linux i686; es-AR; rv:1.8.1.6) Gecko/20070803 Firefox/2.0.0.6 (Swiftfox)"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.8.1.6", ua.render_engine_version.full
    assert_equal :firefox, ua.name
    assert_equal "2.0.0.6", ua.version.full
    assert_equal "2.0", ua.version.major
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

  def test_firefox_302_mac_intel
    ua = UserAgent.new "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5.7; it; rv:1.9) Gecko/20080920 Firefox/3.0.2"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.9", ua.render_engine_version.full
    assert_equal :firefox, ua.name
    assert_equal "3.0.2", ua.version.full
    assert_equal "3.0", ua.version.major
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

  def test_firefox_305_mac_ppc
    ua = UserAgent.new "Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10.4; fr; rv:1.9.0.5) Gecko/2008120121 Firefox/3.0.5"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.9.0.5", ua.render_engine_version.full
    assert_equal :firefox, ua.name
    assert_equal "3.0.5", ua.version.full
    assert_equal "3.0", ua.version.major
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

  def test_firefox_305_gentoo
    ua = UserAgent.new "Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.0.5) Gecko/2008122406 Gentoo Firefox/3.0.5"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.9.0.5", ua.render_engine_version.full
    assert_equal :firefox, ua.name
    assert_equal "3.0.5", ua.version.full
    assert_equal "3.0", ua.version.major
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

  def test_firefox_305_ubuntu
    ua = UserAgent.new "Mozilla/5.0 (X11; U; Linux i686; sk; rv:1.9.0.5) Gecko/2008121621 Ubuntu/8.04 (hardy) Firefox/3.0.5"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.9.0.5", ua.render_engine_version.full
    assert_equal :firefox, ua.name
    assert_equal "3.0.5", ua.version.full
    assert_equal "3.0", ua.version.major
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

  def test_firefox_305_win_vista
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Windows NT 6.0; pl; rv:1.9.0.5) Gecko/2008120122 Firefox/3.0.5"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.9.0.5", ua.render_engine_version.full
    assert_equal :firefox, ua.name
    assert_equal "3.0.5", ua.version.full
    assert_equal "3.0", ua.version.major
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

  def test_flock_126_win_xp
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.17) Gecko/20080915 Firefox/2.0.0.17 Flock/1.2.6"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.8.1.17", ua.render_engine_version.full
    assert_equal :flock, ua.name
    assert_equal "1.2.6", ua.version.full
    assert_equal "1.2", ua.version.major
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

  def test_flock_202_win_vista
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.0.4) Gecko/2008112016 Firefox/3.0.4 Flock/2.0.2"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.9.0.4", ua.render_engine_version.full
    assert_equal :flock, ua.name
    assert_equal "2.0.2", ua.version.full
    assert_equal "2.0", ua.version.major
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

  def test_gran_paradiso_30a7_win_xp
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9a7) Gecko/2007080210 GranParadiso/3.0a7"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.9a7", ua.render_engine_version.full
    assert_equal :granparadiso, ua.name
    assert_equal "3.0a7", ua.version.full
    assert_equal "3.0a", ua.version.major
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

  def test_k_meleon_win2k
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Windows NT 5.0; de-DE; rv:1.8.1.8) Gecko/20071013 K-Meleon/1.5"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.8.1.8", ua.render_engine_version.full
    assert_equal :"k-meleon", ua.name
    assert_equal "1.5", ua.version.full
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

  def test_k_meleon_win2k
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Windows NT 5.0; de-DE; rv:1.8.1.8) Gecko/20071013 K-Meleon/1.5"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.8.1.8", ua.render_engine_version.full
    assert_equal :"k-meleon", ua.name
    assert_equal "1.5", ua.version.full
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

  def test_minefield_31b2pre_win_vista
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.1b2pre) Gecko/20081011 Minefield/3.1b2pre"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.9.1b2pre", ua.render_engine_version.full
    assert_equal :minefield, ua.name
    assert_equal "3.1b2pre", ua.version.full
    assert_equal "3.1b", ua.version.major
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

  def test_navigator_win98
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.1.8pre) Gecko/20071019 Firefox/2.0.0.8 Navigator/9.0.0.1"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.8.1.8pre", ua.render_engine_version.full
    assert_equal :navigator, ua.name
    assert_equal "9.0.0.1", ua.version.full
    assert_equal "9", ua.version.major
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

  def test_netscape_61_mac_ppc
    ua = UserAgent.new "Mozilla/5.0 (Macintosh; U; PPC; de-DE; rv:0.9.2) Gecko/20010726 Netscape6/6.1"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "0.9.2", ua.render_engine_version.full
    assert_equal :netscape, ua.name
    assert_equal "6.1", ua.version.full
    assert_equal "6.1", ua.version.major
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

  def test_netscape_702_mac_ppc
    ua = UserAgent.new "Mozilla/5.0 (Macintosh; U; PPC; de-DE; rv:1.0.2) Gecko/20030208 Netscape/7.02"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.0.2", ua.render_engine_version.full
    assert_equal :netscape, ua.name
    assert_equal "7.02", ua.version.full
    assert_equal "7.0", ua.version.major
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

  def test_netscape_81_win98
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.7.5) Gecko/20060127 Netscape/8.1"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.7.5", ua.render_engine_version.full
    assert_equal :netscape, ua.name
    assert_equal "8.1", ua.version.full
    assert_equal "8.1", ua.version.major
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

  def test_seamonkey_119_mac_intel
    ua = UserAgent.new "Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.13) Gecko/20080313 SeaMonkey/1.1.9"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.8.1.13", ua.render_engine_version.full
    assert_equal :seamonkey, ua.name
    assert_equal "1.1.9", ua.version.full
    assert_equal "1.1", ua.version.major
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

  def test_seamonkey_20a3pre_win_2k
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.9.2a1pre) Gecko/20081228 SeaMonkey/2.0a3pre"
    assert ua.known?
    assert ua.browser?
    assert !ua.bot?
    assert !ua.feed_reader?
    assert !ua.other?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.9.2a1pre", ua.render_engine_version.full
    assert_equal :seamonkey, ua.name
    assert_equal "2.0a3pre", ua.version.full
    assert_equal "2.0a", ua.version.major
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
