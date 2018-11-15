Rails.application.routes.draw do
  resources :auction1s
  resources :auctionns
  resources :hots
  resources :auctions
  resources :nos
  resources :administrators
  resources :premia
  resources :registreds
  resources :users
  resources :properties
  root "properties#home"
  get 'properties/parametrosInProperties'
  get 'nueva_ruta' => 'properties#index', as: 'nuevo'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
