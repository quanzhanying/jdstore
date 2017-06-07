Rails.application.routes.draw do

  resources :orders do
   member do
     post :pay_with_alipay
     post :pay_with_wechat
     post :apply_to_cancel
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

  resources :cart_items

  resources :products do
    member do
      post :add_to_cart
      post :add_to_favorite
      post :quit_favorite
    end
    collection do
      get :search
    end
    resources  :comments
  end

  namespace :admin do
   resources :products do
     member do
       patch :move_up
       patch :move_down
     end
   end

   resources :orders do
     member do
       post :cancel
       post :ship
       post :shipped
       post :return
     end
   end

   resources :categories
 end


 devise_for :users
 root 'welcome#index'
end
