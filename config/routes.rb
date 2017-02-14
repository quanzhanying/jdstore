Rails.application.routes.draw do
  devise_for :users

  root "welcome#index"

  resources :products do
    member do
      post :add_to_cart
    end
  end


  namespace :admin do
    resources :products
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
      post: pay_with_alipay_order_path
      post: pay_with_wechat_order_path
    end
  end

  namespace :account do
    resources :orders
  end

end
