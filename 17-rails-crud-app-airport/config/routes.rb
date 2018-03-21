Rails.application.routes.draw do
  root 'passengers#index'
  resources :tickets, only: [:index]
  resources :passengers
  resources :airlines
  resources :flights, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
