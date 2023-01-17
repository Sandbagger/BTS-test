class ChangeCardsTypePokerHand < ActiveRecord::Migration[7.0]
  def change
    change_column :poker_hands, :cards, :string, array: true, using: "(string_to_array(cards, ','))"
  end
end
