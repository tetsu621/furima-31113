Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products, only: [:new, :create, :index, :show] do
    resources :orders, only: [:index, :create]
  end
    
end
