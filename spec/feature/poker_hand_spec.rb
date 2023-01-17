require "rails_helper"

RSpec.describe "Pokerhand", :type => :feature do
  scenario 'A user clicks creates poker hand', js: true do
    visit ''

    click_button 'Create Poker hand'
    save_and_open_screenshot
    expect(page).to have_content('Error: Hand size should be 5. Please input 5 valid cards')

    find("input[aria-label='First card']").fill_in with: 'invalid'
    find("input[aria-label='Second card']").fill_in with: 'invalid'
    find("input[aria-label='Third card']").fill_in with: 'invalid'
    find("input[aria-label='Forth card']").fill_in with: 'invalid'
    find("input[aria-label='Fifth card']").fill_in with: 'invalid'
    click_button 'Create Poker hand'
    expect(page).to have_content('Cards Error: invalid is not a valid card.')

    find("input[aria-label='First card']").fill_in with: 'AS'
    find("input[aria-label='Second card']").fill_in with: 'AS'
    find("input[aria-label='Third card']").fill_in with: 'AS'
    find("input[aria-label='Forth card']").fill_in with: 'AS'
    find("input[aria-label='Fifth card']").fill_in with: 'AS'
    click_button 'Create Poker hand'

    expect(page).to have_content('Cards Error: No duplicate cards')

    find("input[aria-label='First card']").fill_in with: 'AS'
    find("input[aria-label='Second card']").fill_in with: '2S'
    find("input[aria-label='Third card']").fill_in with: '3S'
    find("input[aria-label='Forth card']").fill_in with: '4S'
    find("input[aria-label='Fifth card']").fill_in with: '5S'
    click_button 'Create Poker hand'

    expect(page).to have_content('2: Straight flush')
  end
end