class Card
  attr_reader :value, :suit

  def initialize(name)
    @name = name
    @value = val_as_number(name.chars[0...-1].join)
    @suit = name.chars.last
  end

  def val_as_number(val)
    val = val.upcase
    return 14 if val == 'A'
    return 13 if val == 'K'
    return 12 if val == 'Q'
    return 11 if val == 'J'
    val.to_i
  end
end
