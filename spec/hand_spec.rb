require "spec_helper"
require "hand"

describe Hand do
  describe '#is_flush?' do
    context 'when it is a flush' do
      it 'returns true' do
        hand = Hand.new(['3H', '4H', '5H', '6H', '7H'])
        expect(hand.is_flush?).to eq(true)
      end
    end

    context 'when it is not a flush' do
      it 'returns false' do
        hand = Hand.new(['3C', '4H', '5H', '6H', '7H'])
        expect(hand.is_flush?).to eq(false)
      end
    end
  end

  describe '#is_straight?' do
    context 'withouth picture cards' do
      context 'when it is a straight' do
        it 'returns true' do
          hand = Hand.new(['3H', '4H', '5H', '6H', '7H'])
          expect(hand.is_straight?).to eq(true)
        end
      end

      context 'when it is not a straight' do
        it 'returns false' do
          hand = Hand.new(['1H', '4H', '5H', '6H', '7H'])
          expect(hand.is_straight?).to eq(false)
        end
      end
    end

    context 'with picture cards' do
      context 'when it is a straight' do
        it 'returns true' do
          hand = Hand.new(['9H', '10H', 'JH', 'QH', 'KH'])
          expect(hand.is_straight?).to eq(true)
        end
      end

      context 'when it is not a straight' do
        it 'returns false' do
          hand = Hand.new(['2H', '10H', 'JH', 'QH', 'KH'])
          expect(hand.is_straight?).to eq(false)
        end
      end
    end

    context 'when an Ace' do
      context 'when Ace is high' do
        context 'when it is a straight' do
          it 'returns true' do
            hand = Hand.new(['10H', 'JH', 'QH', 'KH', 'AH'])
            expect(hand.is_straight?).to eq(true)
          end
        end

        context 'when it is not a straight' do
          it 'returns false' do
            hand = Hand.new(['9H', 'JH', 'QH', 'KH', 'AH'])
            expect(hand.is_straight?).to eq(false)
          end
        end
      end

      context 'when Ace is low' do
        context 'when it is a straight' do
          it 'returns true' do
            hand = Hand.new(['AH', '2H', '3H', '4H', '5H'])
            expect(hand.is_straight?).to eq(true)
          end
        end

        context 'when it is not a straight' do
          it 'returns false' do
            hand = Hand.new(['AH', '3C', '3H', '4H', '5H'])
            expect(hand.is_straight?).to eq(false)
          end
        end
      end
    end
  end

  describe '#is_straight_flush?' do
    context 'when it is a straight flush' do
      hands = [
        Hand.new(['3H', '4H', '5H', '6H', '7H']),
        Hand.new(['10H', 'JH', 'QH', 'KH', 'AH']),
        Hand.new(['AC', '2C', '3C', '4C', '5C'])
      ]
      hands.each_with_index do |hand, i|
        it "returns true for hand #{i+1}" do
          expect(hand.is_straight_flush?).to eq(true)
        end
      end
    end

    context 'when it is not a straight flush' do
      hands = [
        Hand.new(['2H', '4H', '5H', '6H', '7H']),
        Hand.new(['9H', 'JH', 'QH', 'KH', 'AH']),
        Hand.new(['AH', '2C', '3C', '4C', '5C'])
      ]
      hands.each_with_index do |hand, i|
        it "returns false for hand #{i+1}" do
          expect(hand.is_straight_flush?).to eq(false)
        end
      end
    end
  end

  describe '#is_four_of_a_kind?' do
    context 'when it is four of a kind' do
      hands = [
        Hand.new(['4H', '4C', '4D', '4S', 'AH']),
        Hand.new(['AH', 'AC', '4D', 'AS', 'AH']),
        Hand.new(['JH', 'JC', '5D', 'JS', 'JH'])
      ]
      hands.each_with_index do |hand, i|
        it "returns true for hand #{i+1}" do
          expect(hand.is_four_of_a_kind?).to eq(true)
        end
      end
    end

    context 'when it is not four of a kind' do
      hands = [
        Hand.new(['AH', '4C', '4D', '4S', 'AH']),
        Hand.new(['AH', 'AC', '4D', 'AS', 'JH']),
        Hand.new(['2H', 'JC', '5D', 'JS', 'JH'])
      ]
      hands.each_with_index do |hand, i|
        it "returns false for hand #{i+1}" do
          expect(hand.is_four_of_a_kind?).to eq(false)
        end
      end
    end
  end

  describe '#is_three_of_a_kind?' do
    context 'when it is three of a kind' do
      it 'return true' do
        # TODO test multipe scenarios
        hand = Hand.new(['2H', '2C', '2D', '4S', 'AH'])
        expect(hand.is_three_of_a_kind?).to eq(true)
      end
    end

    # TODO test failing scenarios
  end

  describe '#is_one_pair?' do
    context 'when it is two of a kind' do
      it 'return true' do
        # TODO test multipe scenarios
        hand = Hand.new(['2H', '2C', '3D', '4S', 'AH'])
        expect(hand.is_one_pair?).to eq(true)
      end
    end

    # TODO test failing scenarios
  end

  describe '#is_full_house?' do
    context 'when it is a full house' do
      it 'returns true' do
        # TODO test multipe scenarios
        hand = Hand.new(['2H', '2C', '2D', '3S', '3H'])
        expect(hand.is_full_house?).to eq(true)
      end

      # TODO test failing scenarios
    end
  end

  describe '#is_two_pairs?' do
    context 'when it is two pairs' do
      it 'return true' do
        # TODO test multipe scenarios
        hand = Hand.new(['2H', '2C', '3D', '3S', 'AH'])
        expect(hand.is_two_pairs?).to eq(true)
      end
    end

    # TODO test failing scenarios
  end

  describe '#is_no_hand?' do
    context 'when it is not any hand' do
      it 'return true' do
        # TODO test multipe scenarios
        hand = Hand.new(['2H', 'AC', '4D', '9S', 'KH'])
        expect(hand.is_no_hand?).to eq(true)
      end
    end

    # TODO test failing scenarios
  end
end
