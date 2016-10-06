Rails.application.routes.draw do

  root "figures#index"

  resources :figures, only: [:new, :create, :index, :show]
  resources :categories, only: [:index, :show]


  devise_for :users
  resources :users, only: [:index, :show, :update, :edit]

end
