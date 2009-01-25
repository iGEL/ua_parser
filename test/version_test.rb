$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'ua_parser/version'

class VersionTest < Test::Unit::TestCase
  include UaParser
  def test_compare_1
    assert Version.new("1.0") < Version.new("2.0")
  end

  def test_compare_2
    assert Version.new("1.0") < Version.new("1.2")
  end

  def test_compare_3
    assert Version.new("1.0.0") > Version.new("1.0b2")
  end

  def test_compare_4
    assert Version.new("1.0") > Version.new("1.0b2")
  end

  def test_compare_5
    assert Version.new("1.0") == Version.new("1.0")
  end

  def test_compare_6
    assert Version.new("1.0") < Version.new("1.0.2")
  end

  def test_compare_7
    assert Version.new("1.0.2") => Version.new("1.0")
  end

  def test_compare_8
    assert Version.new("1.10.3") => Version.new("1.3.7")
  end

  def test_compare_different_agents
    assert_raise Version::DifferentAgentsNotComparable do
      Version.new("1.0", :opera) < Version.new("2.0", :netscape)
    end
  end

  def test_compare_same_agents
    assert Version.new("1.0.2", :opera) => Version.new("1.0", :opera)
  end

  def test_compare_with_integer
    assert_raise TypeError do
      Version.new("1.0") < 3
    end
  end
  
  def test_initialize_with_array
    assert_raise TypeError do 
      Version.new([1, 2, 3])
    end
  end

  def test_initialize_with_float
    v = Version.new(1.0)
    assert_kind_of Version, v
    assert_equal "1.0", v.full
  end

  def test_initialize_with_integer
    v = Version.new(1)
    assert_kind_of Version, v
    assert_equal "1", v.full
  end

  def test_initialize_with_nil
    assert_raise TypeError do
      Version.new(nil)
    end
  end

  def test_initialize_with_string
    v = Version.new("1.0")
    assert_kind_of Version, v
    assert_equal "1.0", v.full
  end

  def test_major_1
    v = Version.new "1"
    assert_equal "1", v.major
  end

  def test_major_1_0
    v = Version.new "1.0"
    assert_equal "1.0", v.major
  end

  def test_major_1_12
    v = Version.new "1.12"
    assert_equal "1.12", v.major
  end

  def test_major_1_12_opera
    v = Version.new "1.12", :opera
    assert_equal "1.1", v.major
  end

  def test_major_2_0_0_14
    v = Version.new "2.0.0.14"
    assert_equal "2.0", v.major
  end

  def test_major_2_0b3
    v = Version.new "2.0b3"
    assert_equal "2.0b", v.major
  end

  def test_major_4_0_dp
    v = Version.new "4.0dp"
    assert_equal "4.0dp", v.major
  end

  def test_major_503_34
    v = Version.new "503.34"
    assert_equal "503.34", v.major
  end
end
