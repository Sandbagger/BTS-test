require 'rails_helper'
RSpec.describe 'Rank' do
  describe 'Five of a kind' do
    describe 'when a matching wildcard has been provided' do
      it 'should return correct rank and label for five of a kind' do
        five_of_a_kind = %w[AH AS AC AD 2H 2H].map{|card| Card.new(card)}
        rank = Rank.new(five_of_a_kind)
        expect(rank.five_of_a_kind?).to eq(true)
        expect(rank.call).to eq('1: Five of a kind')
      end
      describe 'when a non-matching wildcard has been provided' do
        it 'should return correct rank and label for four of a kind' do
          four_of_a_kind = %w[AH AS AC AD 2H 3D].map{|card| Card.new(card)}
          rank = Rank.new(four_of_a_kind)
          expect(rank.five_of_a_kind?).to eq(false)
          expect(rank.call).to eq('3: Four of a kind')
        end
      end
    end
  end

  describe 'Straight flush' do
    it 'should return correct rank and label for straight flush' do
      straight_flush = %w[2H 3H 4H 5H 6H].map{|card| Card.new(card)}
      rank = Rank.new(straight_flush)
      expect(rank.straight_flush?).to eq(true)
      expect(rank.call).to eq('2: Straight flush')
    end
  end

  describe 'Four of a kind' do
    it 'should return correct rank and label for four of a kind' do
      four_of_a_kind = %w[AH AS AC AD 2H].map{|card| Card.new(card)}
      rank = Rank.new(four_of_a_kind)
      expect(rank.four_of_a_kind?).to eq(true)
      expect(rank.call).to eq('3: Four of a kind')
    end
  end

  describe 'Full house' do
    it 'should return correct rank and label for full house' do
      full_house = %w[AH AS AC 2D 2H].map{|card| Card.new(card)}
      rank = Rank.new(full_house)
      expect(rank.full_house?).to eq(true)
      expect(rank.call).to eq('4: Full house')
    end
  end

  describe 'Flush' do
    it 'should return correct rank and label for flush' do
      flush = %w[AH 3H 7H 9H 2H].map{|card| Card.new(card)}
      rank = Rank.new(flush)
      expect(rank.flush?).to eq(true)
      expect(rank.call).to eq('5: Flush')
    end
  end

  describe 'Straight' do
    describe 'when a straight has an ace high' do
      it 'should return correct rank and label for straight' do
        straight = %w[2H 3S 4C 5D AH].map{|card| Card.new(card)}
        rank = Rank.new(straight)
        expect(rank.straight?).to eq(true)
        expect(rank.call).to eq('6: Straight')
      end
    end

    describe 'when a straight has an ace low' do
      it 'should return correct rank and label for straight' do
        straight = %w[2H 3S 4C 5D AH].map{|card| Card.new(card)}
        rank = Rank.new(straight)
        expect(rank.straight?).to eq(true)
        expect(rank.call).to eq('6: Straight')
      end
    end
  end

  describe 'Three of a kind' do
    it 'should return correct rank and label for three of a kind' do
      three_of_a_kind = %w[AH AS AC 5D 6H].map{|card| Card.new(card)}
      rank = Rank.new(three_of_a_kind)
      expect(rank.three_of_a_kind?).to eq(true)
      expect(rank.call).to eq('7: Three of a kind')
    end
  end

  describe 'Two pair' do
    it 'should return correct rank and label for two pair' do
      two_pair = %w[AH AS 5C 5D 6H].map{|card| Card.new(card)}
      rank = Rank.new(two_pair)
      expect(rank.two_pair?).to eq(true)
      expect(rank.call).to eq('8: Two pair')
    end
  end

  describe 'One pair' do
    it 'should return correct rank and label for one pair' do
      one_pair = %w[AH AS 5C 7D 6H].map{|card| Card.new(card)}
      rank = Rank.new(one_pair)
      expect(rank.one_pair?).to eq(true)
      expect(rank.call).to eq('9: One pair')
    end
  end

  describe 'High card' do
    it 'should return correct rank and label for high card' do
      high_card = %w[AH 3S 7C 9D 2H].map{|card| Card.new(card)}
      rank = Rank.new(high_card)
      expect(rank.high_card?).to eq(true)
      expect(rank.call).to eq('10: High card')
    end
  end
end