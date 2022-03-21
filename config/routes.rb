Rails.application.routes.draw do
  root to: "home#show"
  devise_for :users, controllers: { registrations: "users/registrations" }
  resource :profile, only: %i[show edit update]

  resources :recipes, only: %i(index show)
  resources :ingredients

  namespace :users do
    resources :recipes, only: %i(new create edit update destroy), module: :users
  end
end
