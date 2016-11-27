Rails.application.routes.draw do

  devise_for :users

  namespace :admin do
    resources :products do
      member do
        post :publish
        post :hide
      end
    end
    resources :users do
      member do
        post :admin
        post :user
      end
    end
    resources :orders do
      member do
        post :ship
        post :cancell
        post :return_good
        post :deliver
      end
    end
    resources :posts do
      member do
        post :create
      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :users

  resources :carts do
      collection do
      post :checkout
      delete :destroy
    end
  end


  resources :cart_items do
    member do
      post :up_cart_item
      post :down_cart_item
    end
  end

  resources :orders do
    member do
      post :pay_with_wechat
      post :pay_with_alipay
    end
      resources :product_lists
  end

  namespace :account do
    resources :orders do
      member do
        post :require_cancell
        post :cancell
        post :pay_with_wechat
        post :pay_with_alipay
        post :require_return_good
      end
    end
    resources :product_lists
  end

 resources :posts
  root 'welcome#index'

end
