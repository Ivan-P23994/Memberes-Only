Rails.application.routes.draw do
  devise_for :users
  resources :tweeets, only: [:new, :create, :index]

  root "tweeets#index"
end
