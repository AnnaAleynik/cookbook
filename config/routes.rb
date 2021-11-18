Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get "/recipes", to: "recipes#index"
end
