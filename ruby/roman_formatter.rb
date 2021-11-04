class RomanFormatter
  def format(arabic)
    roman = ''

    arabicNumeral = 10
    romanNumeral = 'X'
    while arabic >= arabicNumeral do
      roman += romanNumeral
      arabic -= arabicNumeral
    end
    arabicNumeral = 1
    romanNumeral = 'I'
    while arabic >= arabicNumeral do
      roman += romanNumeral
      arabic -= arabicNumeral
    end

    roman
  end
end
