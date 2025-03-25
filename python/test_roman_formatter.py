#: Roman Numerals Kata
# I: 1
# V: 5
# X: 10
# L: 50
# C: 100
# D: 500
# M: 1000

from roman_formatter import RomanFormatter

def test_convert_1():
    fmt = RomanFormatter()
    roman = fmt.format(1)
    assert roman == "I"
