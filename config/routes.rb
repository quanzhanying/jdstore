Rails.application.routes.draw do

  namespace :admin do
   resources :products do
     member do
       patch :move_up
       patch :move_down
     end     
   end
 end

  devise_for :users
  root 'products#index'

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
      collection do
        delete :clean
      end
    end

  resources :cart_items
end
