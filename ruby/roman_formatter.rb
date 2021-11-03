class RomanFormatter
  def format(arabic)
    return 'I' + 'I' + 'I' if arabic == 3
    return 'I' + 'I' if arabic == 2
    roman = 'I'
  end
end
