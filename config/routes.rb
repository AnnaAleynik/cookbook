Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users
  get "/recipes", to: "recipes#index"
end
