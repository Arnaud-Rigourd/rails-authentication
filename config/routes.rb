Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users, only: [:show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "user#index"

  resources :offers, only: [:index, :new, :create, :show] do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :bookings, except: [:new, :create]
end
