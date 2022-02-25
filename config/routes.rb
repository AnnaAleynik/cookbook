Rails.application.routes.draw do
  root to: "home#show"
  get "users/profile"
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  resources :recipes
  resources :ingredients
end
