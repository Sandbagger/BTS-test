class Card
  attr_reader :face, :suit, :value
  VALUES = {
    'L' => 0,
    '2' => 1,
    '3' => 2,
    '4' => 3,
    '5' => 4,
    '6' => 5,
    '7' => 6,
    '8' => 7,
    '9' => 8,
    '10' => 9,
    'J' => 10,
    'Q' => 11,
    'K' => 12,
    'A' => 13
  }

  def initialize card
    @face = card[0...-1]
    @suit = card[-1]
    @value = VALUES[@face]
  end

  def value_low
    @face == 'A' ? VALUES['L'] : VALUES[@face]
  end

  def to_s
    "#{@face}#{@suit}"
  end
end