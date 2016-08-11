Rails.application.routes.draw do
  namespace :admin do
    resources :products do
      member do
        post :publish
        post :hide
      end
    end
  end
  devise_for :users

  resources :products do
    member do
      post :add_to_cart
    end
  end
  root 'products#index'

  namespace :admin do
    resources :users do
      member do
        post :admin
        post :user
      end
    end
  end

  resources :carts do
    member do
      post :delete_one_item
    end
  resources :cart_items
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
