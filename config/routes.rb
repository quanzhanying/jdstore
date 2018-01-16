Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'products#index'
  root 'welcome#index'

  devise_for :users

  namespace :account do
     resources :orders
  end

  namespace :admin do
    resources :products
    resources :categories#好像是从这个提取资料的意思
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
     member do
       post :add_to_cart
     end
     collection do
      get :search
    end
   end

   resources :carts do
     collection do
       delete :clean
       post :checkout
     end
   end

   resources :cart_items

   resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

end
