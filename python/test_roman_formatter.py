import pytest

#: Roman Numerals Kata
# I: 1
# V: 5
# X: 10
# L: 50
# C: 100
# D: 500
# M: 1000

from roman_formatter import RomanFormatter

def test_convert_negative_numbers():
    fmt = RomanFormatter()
    with pytest.raises(Exception):
        roman = fmt.format(-1)

def test_convert_0():
    fmt = RomanFormatter()
    with pytest.raises(Exception):
        roman = fmt.format(0)

def test_convert_numbers_greater_than_3999():
    fmt = RomanFormatter()
    with pytest.raises(Exception):
        roman = fmt.format(4000)

def test_convert_non_numeric_values():
    fmt = RomanFormatter()
    with pytest.raises(Exception):
        roman = fmt.format("foo")

def test_convert_non_integer_values():
    fmt = RomanFormatter()
    with pytest.raises(Exception):
        roman = fmt.format(1.1)

def test_convert_1():
    fmt = RomanFormatter()
    roman = fmt.format(1)
    assert roman == "I"

def test_convert_2():
    fmt = RomanFormatter()
    roman = fmt.format(2)
    assert roman == "II"

def test_convert_3():
    fmt = RomanFormatter()
    roman = fmt.format(3)
    assert roman == "III"

def test_convert_4():
    fmt = RomanFormatter()
    roman = fmt.format(4)
    assert roman == "IV"

def test_convert_5():
    fmt = RomanFormatter()
    roman = fmt.format(5)
    assert roman == "V"

def test_convert_6():
    fmt = RomanFormatter()
    roman = fmt.format(6)
    assert roman == "VI"

def test_convert_8():
    fmt = RomanFormatter()
    roman = fmt.format(8)
    assert roman == "VIII"

def test_convert_9():
    fmt = RomanFormatter()
    roman = fmt.format(9)
    assert roman == "IX"

def test_convert_10():
    fmt = RomanFormatter()
    roman = fmt.format(10)
    assert roman == "X"

def test_convert_20():
    fmt = RomanFormatter()
    roman = fmt.format(20)
    assert roman == "XX"

def test_convert_30():
    fmt = RomanFormatter()
    roman = fmt.format(30)
    assert roman == "XXX"

def test_convert_40():
    fmt = RomanFormatter()
    roman = fmt.format(40)
    assert roman == "XL"

def test_convert_50():
    fmt = RomanFormatter()
    roman = fmt.format(50)
    assert roman == "L"

def test_convert_90():
    fmt = RomanFormatter()
    roman = fmt.format(90)
    assert roman == "XC"

def test_convert_300():
    fmt = RomanFormatter()
    roman = fmt.format(300)
    assert roman == "CCC"

def test_convert_400():
    fmt = RomanFormatter()
    roman = fmt.format(400)
    assert roman == "CD"

def test_convert_500():
    fmt = RomanFormatter()
    roman = fmt.format(500)
    assert roman == "D"

def test_convert_900():
    fmt = RomanFormatter()
    roman = fmt.format(900)
    assert roman == "CM"

def test_convert_3000():
    fmt = RomanFormatter()
    roman = fmt.format(3000)
    assert roman == "MMM"
