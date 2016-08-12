Rails.application.routes.draw do
  devise_for :users
  resources :products

  namespace :admin do
    resources :products
    resources :orders do
    member do
      post :pay_with_wechat
      post :pay_with_alipay
    end
  end
  end

resources :carts do
 member do
   post :add_product
   post :reduce_product
 end
 collection do
   post :checkout
 end
 end

resources :orders do
  member do
    post :pay_with_wechat
    post :pay_with_alipay
    post :cancel
  end
end

resources :products do
  member do
    post :add_to_cart
  end
end
  root"products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
