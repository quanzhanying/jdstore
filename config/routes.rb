Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :products
    resources :users do
      member do
        post :admin
        post :user
      end
    end
  end
  resources :products
  root 'products#index'
end
