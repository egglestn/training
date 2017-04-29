Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, controllers: { registrations: "registrations" }

  resources :exercises
  resources :users do
    resources :programmes
  end

  get '/', to: 'dashboard#index'
  root to: 'dashboard#index'
end
