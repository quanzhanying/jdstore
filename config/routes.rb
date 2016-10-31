Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :products do
      member do
        post :publish
        post :hide
      end
    end
    resources :users do
      member do
        post :admin
        post :user
      end
    end
  end
  resources :products
  resources :users do
    resources :cars
  end
  root 'products#index'
end
