#: Roman Numerals Kata
# I: 1
# V: 5
# X: 10
# L: 50
# C: 100
# D: 500
# M: 1000

require 'minitest/autorun'
require './roman_formatter'

class TestRomanFormatter < Minitest::Test
  def test_convert_negative_numbers
    fmt = RomanFormatter.new
    assert_raises do
      roman = fmt.format(-1)
    end
  end

  def test_convert_0
    fmt = RomanFormatter.new
    assert_raises do
      roman = fmt.format(0)
    end
  end

  def test_convert_numbers_greater_than_3999
    fmt = RomanFormatter.new
    assert_raises do
      roman = fmt.format(4000)
    end
  end

  def test_convert_non_numeric_values
    fmt = RomanFormatter.new
    assert_raises do
      roman = fmt.format("foo")
    end
  end

  def test_convert_non_integer_values
    fmt = RomanFormatter.new
    assert_raises do
      roman = fmt.format(1.1)
    end
  end

  def test_convert_1
    fmt = RomanFormatter.new
    roman = fmt.format(1)
    assert_equal "I", roman
  end

  def test_convert_2
    fmt = RomanFormatter.new
    roman = fmt.format(2)
    assert_equal "II", roman
  end

  def test_convert_3
    fmt = RomanFormatter.new
    roman = fmt.format(3)
    assert_equal "III", roman
  end

  def test_convert_4
    fmt = RomanFormatter.new
    roman = fmt.format(4)
    assert_equal "IV", roman
  end

  def test_convert_5
    fmt = RomanFormatter.new
    roman = fmt.format(5)
    assert_equal "V", roman
  end

  def test_convert_6
    fmt = RomanFormatter.new
    roman = fmt.format(6)
    assert_equal "VI", roman
  end

  def test_convert_8
    fmt = RomanFormatter.new
    roman = fmt.format(8)
    assert_equal "VIII", roman
  end

  def test_convert_9
    fmt = RomanFormatter.new
    roman = fmt.format(9)
    assert_equal "IX", roman
  end

  def test_convert_10
    fmt = RomanFormatter.new
    roman = fmt.format(10)
    assert_equal "X", roman
  end

  def test_convert_20
    fmt = RomanFormatter.new
    roman = fmt.format(20)
    assert_equal "XX", roman
  end

  def test_convert_30
    fmt = RomanFormatter.new
    roman = fmt.format(30)
    assert_equal "XXX", roman
  end

  def test_convert_40
    fmt = RomanFormatter.new
    roman = fmt.format(40)
    assert_equal "XL", roman
  end

  def test_convert_50
    fmt = RomanFormatter.new
    roman = fmt.format(50)
    assert_equal "L", roman
  end

  def test_convert_90
    fmt = RomanFormatter.new
    roman = fmt.format(90)
    assert_equal "XC", roman
  end

  def test_convert_300
    fmt = RomanFormatter.new
    roman = fmt.format(300)
    assert_equal "CCC", roman
  end

  def test_convert_400
    fmt = RomanFormatter.new
    roman = fmt.format(400)
    assert_equal "CD", roman
  end

  def test_convert_500
    fmt = RomanFormatter.new
    roman = fmt.format(500)
    assert_equal "D", roman
  end

  def test_convert_900
    fmt = RomanFormatter.new
    roman = fmt.format(900)
    assert_equal "CM", roman
  end

  def test_convert_3000
    fmt = RomanFormatter.new
    roman = fmt.format(3000)
    assert_equal "MMM", roman
  end
end
