Rails.application.routes.draw do
  devise_for :users

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    member do
      delete :delete_cart_item
    end
  end

  namespace :admin do
    resources :products
  end

  root 'products#index'
end
