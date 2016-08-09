Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    member do
      post :clear_cart
    end

    collection do
      post :checkout
    end
  end

  resources :cart_items do
    member do
      post :change_quantity
    end
  end

  resources :orders

  namespace :admin do
    resources :products

    resources :users do
      member do
        post :be_admin
      end
    end
  end

  root 'products#index'
end
