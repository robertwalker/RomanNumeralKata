class RomanFormatter
  def format(arabic)
    roman = ''

    arabicNumerals = [10, 1]
    romanNumerals = ['X', 'I']
    while arabic >= arabicNumerals[0] do
      roman += romanNumerals[0]
      arabic -= arabicNumerals[0]
    end
    while arabic >= arabicNumerals[1] do
      roman += romanNumerals[1]
      arabic -= arabicNumerals[1]
    end

    roman
  end
end
