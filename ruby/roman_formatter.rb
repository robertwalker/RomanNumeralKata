class RomanFormatter
  def format(arabic)
    roman = ''

    return 'X' if arabic == 10
    for _ in 0...arabic do
      roman += 'I'
    end

    roman
  end
end
