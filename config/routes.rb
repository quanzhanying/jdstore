Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :products do
      member do
        put :publish
        put :private
      end
    end

    resources :users do
      member do
        put :cgadmin
        put :cguser
      end
    end

  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      post :clear_cart
      # put :item_increase
      # put :item_decrease
      resources :cart_items do
        member do
          put :item_increase
          put :item_decrease
        end
      end
      # post :rm_from_cart
    end

  end
  
  root 'products#index'

end
