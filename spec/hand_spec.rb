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
end











