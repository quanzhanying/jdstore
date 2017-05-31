Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, :controllers => { :registrations => "users/registrations" }

  namespace :admin do
    resources :products
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
    member  do
      post  :add_to_cart
    end
    collection do
      get :search
    end
  end

  resources  :carts do
    collection  do
      delete  :clean
      post  :checkout
    end
  end
  namespace  :account  do
    resources  :orders
  end

  resources  :cart_items
  resources :categories

  resources  :orders  do
      member  do
        post  :pay_with_alipay
        post  :pay_with_wechat
        post :apply_to_cancel
      end
    end
end
