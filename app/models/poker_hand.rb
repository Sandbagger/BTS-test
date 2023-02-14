class PokerHand < ApplicationRecord
  # given more time I would have used drop down menus for the cards in the form
  VALID_CARDS = %w[
    AD 2D 3D 4D 5D 6D 7D 8D 9D 10D JD KD QD AD
    AC 2C 3C 4C 5C 6C 7C 8C 9C 10C JC KC QC AC
    AH 2H 3H 4H 5H 6H 7H 8H 9H 10H JH KH QH AH
    AS 2S 3S 4S 5S 6S 7S 8S 9S 10S JS KS QS AS
  ].freeze

  validates_each :cards do |record, attr, value|
    if value.reject(&:blank?).size != 5
      record.errors.add(attr,
                        'Error: Hand size should be 5. Please input 5 valid cards')
    end
    value.all?(&:present?) && value.each do |card|
      record.errors.add(attr, "Error: #{card} is not a valid card.") unless VALID_CARDS.include?(card)
    end
    value.all?(&:present?) && record.errors.add(attr, 'Error: No duplicate cards') if value.uniq.size != value.size
  end

  def rank
    if wildcard.present?
      Rank.new(cards: cards.map { |card| Card.new(card) }, wildcard: Card.new(wildcard)).call
    else
      Rank.new(cards: cards.map { |card| Card.new(card) }).call
    end
  end
end
