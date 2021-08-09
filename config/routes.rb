Rails.application.routes.draw do
  devise_for :users
  get "/recipes", to: "recipes#index"
end
