Rails.application.routes.draw do
  root 'products#index'
  namespace :admin do
    resources :products
  end
  devise_for :users

  resources :products do
    member do
      post :add_to_cart
    end
  end
end
