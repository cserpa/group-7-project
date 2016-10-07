Rails.application.routes.draw do

  root "figures#index"

  resources :figures, only: [:new, :create, :index, :show]
  resources :categories, only: [:index, :show]
  resources :ratings, only: [:create]
  resources :votes, only: [:create, :show]

  devise_for :users
  resources :users, only: [:index, :show, :update, :edit]

end
