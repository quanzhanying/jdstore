Rails.application.routes.draw do

  devise_for :users


    resources :carts do
      collection do
        post :checkout
      end
    end

     resources :carts
     resources :cart_items

     namespace :admin do
       resources :products
     end

   resources :products do

     member do
       post :add_to_cart
     end
   end

   resources :orders do
     member do
       post :pay_with_wechat
       post :pay_with_alipay
     end
   end
   namespace :account do
   resources :orders
 end

  root 'products#index'
end
