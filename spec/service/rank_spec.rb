require 'rails_helper'
RSpec.describe 'Rank' do
  describe 'five_of_a_kind?' do
    it 'should return true if there are five of a kind' do
      five_of_a_kind = %w[AH AS AC AD 2H 2H].map{|card| Card.new(card)}
      rank = Rank.new(five_of_a_kind)
      expect(rank.five_of_a_kind?).to eq(true)
      expect(rank.call).to eq('1: Five of a kind')
    end

    it 'should return false if there are not five of a kind' do
      four_of_a_kind = %w[AH AS AC AD 2H 3D].map{|card| Card.new(card)}
      rank = Rank.new(four_of_a_kind)
      expect(rank.five_of_a_kind?).to eq(false)
      expect(rank.call).to eq('3: Four of a kind')
    end
  end

  describe 'straight_flush?' do
    it 'should return true if there is a straight flush' do
      straight_flush = %w[2H 3H 4H 5H 6H].map{|card| Card.new(card)}
      rank = Rank.new(straight_flush)
      expect(rank.straight_flush?).to eq(true)
      expect(rank.call).to eq('2: Straight flush')
    end

    it 'should return false if there is not a straight flush' do
      high_card = %w[AH 3S 7C 9D 2H].map{|card| Card.new(card)}
      rank = Rank.new(high_card)
      expect(rank.straight_flush?).to eq(false)
      expect(rank.call).to eq('10: High card')
    end
  end

  describe 'four_of_a_kind?' do
    it 'should return true if there are four of a kind' do
      four_of_a_kind = %w[AH AS AC AD 2H].map{|card| Card.new(card)}
      rank = Rank.new(four_of_a_kind)
      expect(rank.four_of_a_kind?).to eq(true)
      expect(rank.call).to eq('3: Four of a kind')
    end

    it 'should return false if there are not four of a kind' do
      high_card = %w[AH 3S 7C 9D 2H].map{|card| Card.new(card)}
      rank = Rank.new(high_card)
      expect(rank.four_of_a_kind?).to eq(false)
      expect(rank.call).to eq('10: High card')
    end
  end

  describe 'full_house?' do
    it 'should return true if there is a full house' do
      full_house = %w[AH AS AC 2D 2H].map{|card| Card.new(card)}
      rank = Rank.new(full_house)
      expect(rank.full_house?).to eq(true)
      expect(rank.call).to eq('4: Full house')
    end

    it 'should return false if there is not a full house' do
      high_card = %w[AH 3S 7C 9D 2H].map{|card| Card.new(card)}
      rank = Rank.new(high_card)
      expect(rank.full_house?).to eq(false)
      expect(rank.call).to eq('10: High card')
    end
  end

  describe 'flush?' do
    it 'should return true if there is a flush' do
      flush = %w[AH 3H 7H 9H 2H].map{|card| Card.new(card)}
      rank = Rank.new(flush)
      expect(rank.flush?).to eq(true)
      expect(rank.call).to eq('5: Flush')
    end

    it 'should return false if there is not a flush' do
      high_card = %w[AH 3S 7C 9D 2H].map{|card| Card.new(card)}
      rank = Rank.new(high_card)
      expect(rank.flush?).to eq(false)
      expect(rank.call).to eq('10: High card')
    end
  end

  describe 'straight?' do
    it 'should return true if there is a straight' do
      straight = %w[2H 3S 4C 5D 6H].map{|card| Card.new(card)}
      rank = Rank.new(straight)
      expect(rank.straight?).to eq(true)
      expect(rank.call).to eq('6: Straight')
    end

    it 'should return true if there is a straight with an ace low' do
      straight = %w[2H 3S 4C 5D AH].map{|card| Card.new(card)}
      rank = Rank.new(straight)
      expect(rank.straight?).to eq(true)
      expect(rank.call).to eq('6: Straight')
    end

    it 'should return false if there is not a straight' do
      high_card = %w[AH 3S 7C 9D 2H].map{|card| Card.new(card)}
      rank = Rank.new(high_card)
      expect(rank.straight?).to eq(false)
      expect(rank.call).to eq('10: High card')
    end
  end

  describe 'three_of_a_kind?' do
    it 'should return true if there is a three of a kind' do
      three_of_a_kind = %w[AH AS AC 5D 6H].map{|card| Card.new(card)}
      rank = Rank.new(three_of_a_kind)
      expect(rank.three_of_a_kind?).to eq(true)
      expect(rank.call).to eq('7: Three of a kind')
    end

    it 'should return false if there is not a three of a kind' do
      high_card = %w[AH 3S 7C 9D 2H].map{|card| Card.new(card)}
      rank = Rank.new(high_card)
      expect(rank.three_of_a_kind?).to eq(false)
      expect(rank.call).to eq('10: High card')
    end
  end

  describe 'two_pair?' do
    it 'should return true if there is a two pair' do
      two_pair = %w[AH AS 5C 5D 6H].map{|card| Card.new(card)}
      rank = Rank.new(two_pair)
      expect(rank.two_pair?).to eq(true)
      expect(rank.call).to eq('8: Two pair')
    end

    it 'should return false if there is not a two pair' do
      high_card = %w[AH 3S 7C 9D 2H].map{|card| Card.new(card)}
      rank = Rank.new(high_card)
      expect(rank.two_pair?).to eq(false)
      expect(rank.call).to eq('10: High card')
    end
  end

  describe 'one_pair?' do
    it 'should return true if there is a one pair' do
      one_pair = %w[AH AS 5C 7D 6H].map{|card| Card.new(card)}
      rank = Rank.new(one_pair)
      expect(rank.one_pair?).to eq(true)
      expect(rank.call).to eq('9: One pair')
    end

    it 'should return false if there is not a one pair' do
      high_card = %w[AH 3S 7C 9D 2H].map{|card| Card.new(card)}
      rank = Rank.new(high_card)
      expect(rank.one_pair?).to eq(false)
      expect(rank.call).to eq('10: High card')
    end
  end

  describe 'high_card?' do
    it 'should return true if there is a high card' do
      high_card = %w[AH 3S 7C 9D 2H].map{|card| Card.new(card)}
      rank = Rank.new(high_card)
      expect(rank.high_card?).to eq(true)
      expect(rank.call).to eq('10: High card')
    end

    it 'should return false if there is not a high card' do
      one_pair = %w[AH AS 5C 7D 6H].map{|card| Card.new(card)}
      rank = Rank.new(one_pair)
      expect(rank.high_card?).to eq(false)
      expect(rank.call).to eq('9: One pair')
    end
  end
end