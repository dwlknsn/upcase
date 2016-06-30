require "card"

class Hand
  def initialize(cards)
    @cards = cards.map { |card| Card.new(card) }
  end

  def is_flush?
    @cards.map { |card| card.suit }.uniq.length == 1
  end

  def is_straight?
    values = @cards.flat_map { |card| card.value }.sort

    if values.first == 2 && values.include?(14)
      values.map! { |val| val == 14 ? 1 : val }.sort!
    end

    values.map.with_index do |v, i|
      v - values[i+1] == -1 if i != 4
    end.compact.all?
  end
end