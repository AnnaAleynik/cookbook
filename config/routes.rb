Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :recipes
  resources :ingredients, only: %i(index new create edit update)
end
