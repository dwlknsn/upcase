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

  def is_straight_flush?
    is_straight? && is_flush?
  end

  def is_four_of_a_kind?
    groups.values.any? { |val| val.length == 4 }
  end

  def is_three_of_a_kind?
    groups.values.any? { |val| val.length == 3 }
  end

  def is_one_pair?
    select_pairs.length == 1
  end

  def is_full_house?
    is_three_of_a_kind? && is_one_pair?
  end

  def is_two_pairs?
    select_pairs.length == 2
  end

  def is_no_hand?
    return false if is_straight_flush?
    return false if is_four_of_a_kind?
    return false if is_full_house?
    return false if is_flush?
    return false if is_straight?
    return false if is_three_of_a_kind?
    return false if is_two_pairs?
    return false if is_one_pair?
    true
  end

  def select_pairs
    groups.values.select { |val| val.length == 2 }
  end

  def groups
    values = @cards.flat_map(&:value)
    groups = values.group_by { |value| value }
  end
end
