Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :cart_items do
    member do
      post :increase
      post :decrease
    end
  end
  resources :carts do
    collection do
      post :checkout
    end
  end

  resources :orders

  namespace :admin do
    resources :orders
    resources :users do
      member do
        post :become_admin
        post :become_user
      end
    end
    resources :products do
      member do
        post :onsale
        post :soldout
      end
    end
  end


  root 'products#index'
end
