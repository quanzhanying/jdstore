Rails.application.routes.draw do
  devise_for :users #default exist

  namespace :admin do
    resources :products
    resources :users do
      member do
        post :change_to_admin
        post :change_to_user
      end
    end
  end


  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    member do
      delete :delete_cart_item
      post :plus_one_to_item
      post :minus_one_to_item
    end
  end

  root 'products#index'
end
