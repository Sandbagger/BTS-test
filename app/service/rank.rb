class Rank
  attr_reader :cards

  RANKS = [
    ['1: Five of a kind', :five_of_a_kind?],
    ['2: Straight flush', :straight_flush?],
    ['3: Four of a kind', :four_of_a_kind?],
    ['4: Full house', :full_house?],
    ['5: Flush', :flush?],
    ['6: Straight', :straight?],
    ['7: Three of a kind', :three_of_a_kind?],
    ['8: Two pair', :two_pair?],
    ['9: One pair', :one_pair?],
    ['10: High card', :high_card?],
  ]

  def initialize(cards:, wildcard: nil)
    @cards = cards
    @wildcard = wildcard
  end

  def call
    # Light use of (controversal) meta-programming, returns response from the first truthy Rank
    RANKS.map { |rank| method(rank[1]).call ? rank[0] : false }
         .find { |res| !!res }
  end

  def five_of_a_kind?
    pp '@wildcard.present? && four_of_a_kind? && @cards.count { |card| card.to_s == @wildcard.to_s } == 1'
    pp @wildcard.present? && four_of_a_kind? && @cards.count { |card| card.to_s == @wildcard.to_s } == 1
    pp @wildcard.present? 
    pp four_of_a_kind?
    pp @cards.count { |card| card.to_s == @wildcard.to_s } == 1
    @wildcard.present? && four_of_a_kind? && @cards.count { |card| card.to_s == @wildcard.to_s } == 1
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    @cards.map(&:face).tally.values.include?(4)
  end

  def full_house?
    three_of_a_kind? && one_pair?
  end

  def flush?
    @cards.map(&:suit).tally.values.include?(5)
  end

  def straight?
    @cards.map(&:value).sort.each_cons(2).all? { |a, b| b == a + 1 } ||
      @cards.map(&:value_low).sort.each_cons(2).all? { |a, b| b == a + 1 }
  end

  def three_of_a_kind?
    @cards.map(&:face).tally.values.include?(3)
  end

  def two_pair?
    @cards.map(&:face).tally.values.count(2) == 2
  end

  def one_pair?
    @cards.map(&:face).tally.values.include?(2)
  end

  def high_card?
    !one_pair? && !two_pair? && !three_of_a_kind? && !straight? && !flush? && !full_house? && !four_of_a_kind? && !straight_flush?
  end
end