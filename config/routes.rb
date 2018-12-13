Rails.application.routes.draw do
  resources :hotsales
  resources :petitions
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
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
  get 'buscar' => 'properties#search', as: 'search'
  get 'Sub' => 'auction1s#index'  
  post 'Subastas_adheridas' => "auction1s#check", as: 'verificar'
  post 'property' => "properties#subastada", as: 'veri'
  patch 'validar', to: 'petitions#validate'
  get 'Subastas_Terminadas' => 'auction1s#terminadas', as: 'terminar' 
  post 'Terminadas' => 'auction1s#delete', as: 'finalizar'
  get 'fechas a subastar' => 'auction1s#fechas', as: 'fecha'  
  get 'compra' => 'hotsales#comprar', as: 'compra' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
