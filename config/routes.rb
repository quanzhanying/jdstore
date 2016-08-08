Rails.application.routes.draw do

  devise_for :users
  
   resources :carts

    resources :products do
      member do
        post :add_to_cart
      end
    end

   root 'products#index'

    namespace :admin do
      resources :products
      resources :users do
        member do
          post :promote
          post :demote
      end
    end
   end

end
