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
  get 'auction1s/index'
  get 'Subastas_adheridas' => 'auction1s#list_auction', as: 'lista'
 get 'Sub' => 'auction1s#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
