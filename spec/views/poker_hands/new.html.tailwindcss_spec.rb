require 'rails_helper'

RSpec.describe "poker_hands/new", type: :view do
  before(:each) do
    assign(:poker_hand, PokerHand.new(
      cards: "MyString"
    ))
  end

  # it "renders new poker_hand form" do
  #   render

  #   assert_select "form[action=?][method=?]", poker_hands_path, "post" do

  #     assert_select "input[name=?]", "poker_hand[cards]"
  #   end
  # end
end
