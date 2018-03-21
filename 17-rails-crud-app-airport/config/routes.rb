Rails.application.routes.draw do
  root 'passengers#index'
  get '/flights/search', to: "flights#index"
  resources :tickets, only: [:index, :create]
  resources :passengers
  resources :airlines, except: [:edit, :update]
  resources :flights, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
