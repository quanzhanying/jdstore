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


  resources :products do
    member do
      post :add_to_cart
    end
  end
  root 'products#index'


  resources :carts do
    member do
      post :delete_one_item
    end
  end

  resources :cart_items do
    member do
      post :add_an_item
      post :minus_an_item
    end
  end


end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.h
