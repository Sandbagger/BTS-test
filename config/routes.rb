Rails.application.routes.draw do
  root 'poker_hands#new'
  resources :poker_hands
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
