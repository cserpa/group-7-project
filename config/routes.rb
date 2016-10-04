Rails.application.routes.draw do
<<<<<<< HEAD

  root "figures#index"

  resources :figures, only: [:new, :create, :index, :show]
  resources :categories, only: [:index, :show]
=======
  root "users#index"
  
  devise_for :users
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
>>>>>>> e6e9e757a80642fdc1d5072ec3fd95b3f5178e05
end
