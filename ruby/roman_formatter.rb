class RomanFormatter
  def format(arabic)
    roman = ''

    arabicNumerals = [10, 9, 5, 4, 1]
    romanNumerals = ['X', 'IX', 'V', 'IV', 'I']
    for index in (0...arabicNumerals.length) do
      while arabic >= arabicNumerals[index] do
        roman += romanNumerals[index]
        arabic -= arabicNumerals[index]
      end
    end

    roman
  end
end
