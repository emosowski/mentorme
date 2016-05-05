Rails.application.routes.draw do
  devise_for :users
  root "index#index"
  resources :users do
    get '/reviews' => 'reviews#index'
  end
  resources :appointments, only: [:new, :create, :index, :update, :show]
end
