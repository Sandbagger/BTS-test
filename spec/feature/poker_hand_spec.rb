require "rails_helper"

RSpec.describe "Pokerhand", :type => :feature do
  scenario 'A user clicks creates poker hand', js: true do
    visit ''

    click_button 'Create Poker hand'
    save_and_open_screenshot
    expect(page).to have_content('Error: please input 5 valid cards')

    find("input[aria-label='First card']").fill_in with: 'AS'
    find("input[aria-label='Second card']").fill_in with: '2S'
    find("input[aria-label='Third card']").fill_in with: '3S'
    find("input[aria-label='Forth card']").fill_in with: '4S'
    find("input[aria-label='Fifth card']").fill_in with: '5S'
    click_button 'Create Poker hand'
    
    expect(page).to have_content('2: Straight flush')
  end
end