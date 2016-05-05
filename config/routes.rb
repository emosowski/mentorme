Rails.application.routes.draw do
  devise_for :users
  root "index#index"
  resources :users
<<<<<<< HEAD
  resources :reviews
=======
  resources :appointments, only: [:new, :create, :index, :update, :show]
>>>>>>> master
end
