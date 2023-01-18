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

## Deplyed site
You can visit the website at https://bts.fly.dev/

## Requirements 
* submit poker hand consisting 5 valid cards and return label and rank

## Validation
- hand size 5
- no duplicate cards
- valid cards


