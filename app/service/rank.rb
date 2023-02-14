class Rank
  attr_reader :cards

  # This class is doing multiple things, it hardcodes the response for each rank, it hardcodes the rank logic
  # and it applies the rank logic to a hand of cards that has been .
  # We could make this class open to future change by using dependency injection to pass in the game logic and the responses. 
  # This might be useful if we wanted to re-use the class and for it to only be responsible for applying game logic to a hand.

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
    ['10: High card', :high_card?]
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

  # Other call sites should not rely on these methods, as they should serve the single purpose of applying rank logic to a hand. 
  # Ideally these methods should be private, but we are using method to invoke them in the call method above, which breaks encapsulation
  # private

  def five_of_a_kind?
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
    true
  end
end
