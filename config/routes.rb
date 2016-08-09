Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  namespace :admin do
    resources :products

    resources :users do
       member do
         post :be_admin
         post :be_user
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
      post :move_product_from_cart
    end
  end

  resources :cart_items do
    member do
      post :clear
      post :add_item
      post :des_item
    end
  end
end
