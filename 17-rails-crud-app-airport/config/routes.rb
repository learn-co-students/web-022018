Rails.application.routes.draw do
  resources :tickets
  resources :passengers
  resources :airlines
  resources :flights
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
