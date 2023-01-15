class Rank
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    @wildcard = cards.size == 6 ? cards.pop : nil
  end

  def five_of_a_kind?
    four_of_a_kind? && cards.count { |card| card.to_s == @wildcard.to_s } == 1
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    @cards.map(&:face).tally.values.include?(4)
  end

  def full_house?
    three_of_a_kind? && pair?
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