class RomanFormatter
  def format(arabic)
    roman = ''

    unless arabic.is_a? Integer
      raise "#{arabic} is not valid integer value"
    end

    unless (1..3999).include? arabic
      raise "#{arabic} is not in valid range of 1-3999"
    end

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
