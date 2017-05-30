Rails.application.routes.draw do
   root 'welcome#index'
   devise_for :users
   namespace :admin do
      resources :products
      resources :category
      resources :elements
      resources :orders do
         member do
            post :cancel
            post :ship
            post :shipped
            post :return
         end
      end
   end

   resources :products do
      resources :elements
      member do
         post :add_to_cart
      end
   end

   resources :carts do
      collection do
         delete :clean
         post :checkout
      end
   end

   resources :cart_items
   resources :category
   resources :elements
   resources :orders do
      member do
         post :pay_with_alipay
         post :pay_with_wechat
         post :apply_to_cancel
      end
 end



   namespace :account do
      resources :orders
      resources :users
   end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
