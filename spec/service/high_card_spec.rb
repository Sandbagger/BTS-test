require 'rails_helper'
RSpec.describe 'HighCard' do
  describe 'HighCard#call' do
    let(:rank) { HighCard.new }
    it 'should return the highest card' do
      expect(rank.call).to eq(true)
    end
  end
end
