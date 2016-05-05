Rails.application.routes.draw do
  devise_for :users
  root "index#index"
  resources :users
  resources :appointments, only: [:new, :create, :index, :update, :show]
end
