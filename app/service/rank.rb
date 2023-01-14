class Rank
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    @wildcard = cards.size == 6 ? cards.pop : nil
  end

  def five_of_a_kind?
    cards.map(&:face).tally.values.include?(4) && cards.count { |card| card.to_s == @wildcard.to_s } == 1
  end

  def four_of_a_kind?
    @cards.map(&:face).tally.values.include?(4)
  end

  def straight_flush?
    flush? && straight?
  end

  def flush?
    @cards.map(&:suit).tally.values.include?(5)
  end

  def straight?
    @cards.map(&:value).sort.each_cons(2).all? { |a, b| b == a + 1 }
  end
end