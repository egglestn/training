Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, controllers: { registrations: "registrations" }

  resources :programmes
  resources :exercises
  resources :users

  get "/", to: "programmes#index"
  root to: "programmes#index"
end
