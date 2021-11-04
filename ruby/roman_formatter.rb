class RomanFormatter
  def format(arabic)
    roman = ''

    while arabic >= 10 do
      roman += 'X'
      arabic -= 10
    end
    while arabic >= 1 do
      roman += 'I'
      arabic -= 1
    end

    roman
  end
end
