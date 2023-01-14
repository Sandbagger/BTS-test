require 'rails_helper'

RSpec.describe "poker_hands/edit", type: :view do
  let(:poker_hand) {
    PokerHand.create!(
      cards: "MyString"
    )
  }

  before(:each) do
    assign(:poker_hand, poker_hand)
  end

  it "renders the edit poker_hand form" do
    render

    assert_select "form[action=?][method=?]", poker_hand_path(poker_hand), "post" do

      assert_select "input[name=?]", "poker_hand[cards]"
    end
  end
end
