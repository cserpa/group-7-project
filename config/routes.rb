Rails.application.routes.draw do

  root "figures#index"

  resources :figures, only: [:new, :create, :index, :show]
  resources :categories, only: [:index, :show]
end
