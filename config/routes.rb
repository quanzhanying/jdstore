Rails.application.routes.draw do
 namespace :admin do
   resources :products
   resources :orders
 end

  root 'products#index'
  devise_for :users

  resources :products do
       member do
         post :add_to_cart
       end
     end
     namespace :account do
           resources :orders
     end
     resources :carts do
         collection do
         delete :clean
         post :checkout
       end
     end
     resources :orders do
     member do
       post :pay_with_alipay
       post :pay_with_wechat
     end
   end
     resources :cart_items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
