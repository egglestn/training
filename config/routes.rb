Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, controllers: { registrations: "registrations" }

  resources :exercises
  resources :users do
    resources :programmes
  end

  get '/', to: 'programmes#index'
  root to: 'programmes#index'
end
