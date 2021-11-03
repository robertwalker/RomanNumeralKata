class RomanFormatter
  def format(arabic)
    roman = ''

    for _ in 0...arabic do
      roman += 'I'
    end

    roman
  end
end
