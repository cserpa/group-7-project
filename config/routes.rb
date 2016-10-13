Rails.application.routes.draw do

  root "figures#index"

  resources :figures, only: [:new, :create, :index, :edit, :update, :show, :destroy]
  get 'search' => 'figures#search'

  resources :categories, only: [:index, :show]
  resources :votes, only: [:create, :show]
  resources :ratings, only: [:create, :destroy]

  devise_for :users
  resources :users, only: [:index, :show, :update, :edit, :destroy]

end
