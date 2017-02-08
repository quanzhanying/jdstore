Rails.application.routes.draw do
    devise_for :users

    namespace :admin do
        resources :products
    end

    resources :products do
        member do
            post :add_to_cart
        end
    end

    root 'products#index'

    resources :carts do
        collection do
            delete :clean
        end
    end

    resources :cart_items
end
