class AddRankToPokerHand < ActiveRecord::Migration[7.0]
  def change
    add_column :poker_hands, :rank, :string
  end
end
