Rails.application.routes.draw do
  resources :auctionns
  resources :hots
  resources :auctions
  resources :nos
  resources :administrators
  resources :premia
  resources :registreds
  resources :users
  resources :properties
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
