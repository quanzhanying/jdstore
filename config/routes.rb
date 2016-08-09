Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root 'products#index'

    namespace :admin do
      resources :products
    end

    resources :products do
      member do
        post :add_to_cart
      end
    end

    resources :carts do
      member do
        post :delete_one

      end

    end
    resources :cart_items do
      member do
        post :incream_quantity
        post :decream_quantity
      end

    end

end
