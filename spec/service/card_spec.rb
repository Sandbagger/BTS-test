require 'rails_helper'
RSpec.describe 'Card' do
  describe 'initialize' do
    it 'should set the face, suit and value' do
      card = Card.new('AH')
      expect(card.face).to eq('A')
      expect(card.suit).to eq('H')
      expect(card.value).to eq(13)
    end
  end

  describe 'to_s' do
    it 'should return the card as a string' do
      card = Card.new('AH')
      expect(card.to_s).to eq('AH')
    end
  end
end