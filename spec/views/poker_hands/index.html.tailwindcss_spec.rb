require 'rails_helper'

RSpec.describe "poker_hands/index", type: :view do
  before(:each) do
    assign(:poker_hands, [
      PokerHand.create!(
        cards: "Cards"
      ),
      PokerHand.create!(
        cards: "Cards"
      )
    ])
  end

  it "renders a list of poker_hands" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Cards".to_s), count: 2
  end
end
