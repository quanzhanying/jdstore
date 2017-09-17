Rails.application.routes.draw do
    devise_for :users
    root 'products#index'
    # root 'admin/products#index'
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
            post :clear
        end
        collection do
            post :checkout
        end
    end

    resources :cart_items

    resources :orders

end
