class AddWildcardToPokerHand < ActiveRecord::Migration[7.0]
  def change
    add_column :poker_hands, :wildcard, :string
  end
end
