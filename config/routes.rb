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

  resources :users

  resources :carts do
      collection do
      delete :destroy
    end
  end


  resources :cart_items

  root 'products#index'

end
