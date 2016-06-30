require "spec_helper"
require "card"

describe Card do
  describe '.initialize' do
    it 'assigns value' do
      card = Card.new('2H')
      expect(card.value).to eq(2)
    end

    it 'assigns suit' do
      card = Card.new('2H')
      expect(card.suit).to eq('H')
    end
  end
end