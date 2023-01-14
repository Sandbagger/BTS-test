class CreatePokerHands < ActiveRecord::Migration[7.0]
  def change
    create_table :poker_hands do |t|
      t.string :cards

      t.timestamps
    end
  end
end
