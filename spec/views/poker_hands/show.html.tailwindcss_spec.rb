require 'rails_helper'

RSpec.describe 'poker_hands/show', type: :view do
  before(:each) do
    assign(:poker_hand, PokerHand.create!(
                          cards: %w[AS 2S 3S 4S 5S]
                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Cards/)
  end
end
