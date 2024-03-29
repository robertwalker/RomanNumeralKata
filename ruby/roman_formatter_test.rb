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
  def test_convert_1
    fmt = RomanFormatter.new
    roman = fmt.format(1)
    assert_equal "I", roman
  end
end
