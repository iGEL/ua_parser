$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'user_agent'

class GeckoTest < Test::Unit::TestCase
  def test_firefox_302_mac_ppc
    ua = UserAgent.new "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5.7; it; rv:1.9) Gecko/20080920 Firefox/3.0.2"
    assert ua.known?
    assert ua.browser?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.9", ua.render_engine_version
    assert_equal :firefox, ua.name
    assert_equal "3.0.2", ua.complete_version
    assert_equal "3.0", ua.version
  end

  def test_firefox_305_gentoo
    ua = UserAgent.new "Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.0.5) Gecko/2008122406 Gentoo Firefox/3.0.5"
    assert ua.known?
    assert ua.browser?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.9.0.5", ua.render_engine_version
    assert_equal :firefox, ua.name
    assert_equal "3.0.5", ua.complete_version
    assert_equal "3.0", ua.version
  end

  def test_firefox_305_ubuntu
    ua = UserAgent.new "Mozilla/5.0 (X11; U; Linux i686; sk; rv:1.9.0.5) Gecko/2008121621 Ubuntu/8.04 (hardy) Firefox/3.0.5"
    assert ua.known?
    assert ua.browser?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.9.0.5", ua.render_engine_version
    assert_equal :firefox, ua.name
    assert_equal "3.0.5", ua.complete_version
    assert_equal "3.0", ua.version
  end

  def test_firefox_305_windows
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Windows NT 6.0; pl; rv:1.9.0.5) Gecko/2008120122 Firefox/3.0.5"
    assert ua.known?
    assert ua.browser?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.9.0.5", ua.render_engine_version
    assert_equal :firefox, ua.name
    assert_equal "3.0.5", ua.complete_version
    assert_equal "3.0", ua.version
  end

  def test_flock_126_windows
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.17) Gecko/20080915 Firefox/2.0.0.17 Flock/1.2.6"
    assert ua.known?
    assert ua.browser?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.8.1.17", ua.render_engine_version
    assert_equal :flock, ua.name
    assert_equal "1.2.6", ua.complete_version
    assert_equal "1.2", ua.version
  end

  def test_flock_202_win_vista
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.0.4) Gecko/2008112016 Firefox/3.0.4 Flock/2.0.2"
    assert ua.known?
    assert ua.browser?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.9.0.4", ua.render_engine_version
    assert_equal :flock, ua.name
    assert_equal "2.0.2", ua.complete_version
    assert_equal "2.0", ua.version
  end

  def test_navigator_win98
    ua = UserAgent.new "Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.1.8pre) Gecko/20071019 Firefox/2.0.0.8 Navigator/9.0.0.1"
    assert ua.known?
    assert ua.browser?
    assert_equal :gecko, ua.render_engine
    assert_equal "1.8.1.8pre", ua.render_engine_version
    assert_equal :navigator, ua.name
    assert_equal "9.0.0.1", ua.complete_version
    assert_equal "9", ua.version
  end
end
