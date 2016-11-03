Rails.application.routes.draw do
  # resources :cart_items
  resources :cart_items do
    member do
      post :initialize
      post :increment_quantity
      post :decrement_quantity
      post :title
      post :price
    end
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end

  resources :carts do
    collection do
      post :checkout
    end
    member do
       post :add_product_to_cart

     end
  end

  devise_for :users

  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
      delete :destroy_to_cart
    end
  end

  namespace :account do
    resources :products
    resources :orders
  end 

  root 'products#index' # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
