Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  # root to: 'home#index'
  resources :users, only: [:new, :create]
  resources :posts, only: [:new, :create, :index]
end
