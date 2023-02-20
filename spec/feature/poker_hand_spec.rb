require 'rails_helper'

RSpec.describe 'Pokerhand', type: :feature do
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

  scenario 'A user clicks creates poker hand with wildcard', js: true do
    visit ''

    find("input[aria-label='First card']").fill_in with: 'AS'
    find("input[aria-label='Second card']").fill_in with: 'AC'
    find("input[aria-label='Third card']").fill_in with: 'AD'
    find("input[aria-label='Forth card']").fill_in with: 'AH'
    find("input[aria-label='Fifth card']").fill_in with: '5S'

    find("input[aria-label='Optional wildcard']").fill_in with: '5S'
    click_button 'Create Poker hand'

    expect(page).to have_content('1: Five of a kind')
  end

  scenario 'A user uses form wizard to submit a poker hand', js: true do
    visit ''

    find('form[data-controller="hand"]')
    find('input[data-target="hand.card1"]')
    find('button[data-action="click->hand#next"]')
    # find('input[data-target="hand.card2"]')
    # find('input[data-target="hand.card3"]')
    # find('input[data-target="hand.card4"]')
    # find('input[data-target="hand.card5"]')
  end

end
