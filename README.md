# README
Submit 5 valid cards and it will display rank and label for the hand as a notice. 

## Set up 
* `git clone https://github.com/Sandbagger/BTS-test`
* cd into the BTS-Test folder and run 
  * `bundle install`
  * `rails db:create`
  * `rails db:migrate`
  * `bin/dev`
* in a seperate terminal `bundle exec rspec` to run tests 

<!-- ## Deplyed site
You can visit the website at https://bts.fly.dev/ -->

## Requirements 
* submit poker hand consisting 5 valid cards and return label and rank

## Additonal Requirements
*   Form wizard for adding cards to a hand 
*   Additional form wizard for constructing cards before adding cards to the hand 
    - for each card
      - choose suit 
      - choose face
      - summary  

## Validation
- hand size 5
- no duplicate cards
- valid cards

## TODO
  ### First pass
    View
      - ~~attach view controller on form `data: { controller: 'hand'~~
      - ~~add target for each card `data: { target: 'first_card' }`~~
      - ~~add action click->hand#next on next button~~
    Model
      - ~~create persistent class method that takes session id and a values array~~
      - ~~if values array write to cache and return model instace with cached values~~ 
      - ~~otherwise, return instance with cached values~~ 
    Card reflex
      - declare steps `STEPS = [:card_1, :card_2, card_3, card_4, card_5]
      - next method that accepts value array
        - write to cache 
        - increment step
    View controller
      - ~~declare static targets `static targets = ['first_card', 'second_card' ]~~
      - ~~declare next method that handles event object~~
        - ~~prevent default~~ 
        - ~~map to reflex~~ 

   For each card in hand, select card from Form Wizard for adding cards to the hand 
    - for each card
      - choose suit 
      - choose face
      - summary  
  Install Stimulus Reflex
    - pin 'stimulus_reflex', to: 'stimulus_reflex.min.js', preload: true