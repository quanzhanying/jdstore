Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks"}
  namespace :admin do
    resources :products do
      collection do
        post :csv_create
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
  end

  resources :products do
    resources :reviews
    collection do
      get :search
    end
    member do
      post :favorite
      post :unfavorite
      post :add_to_cart
      post :checkout
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end
  resources :cart_items do
    get :up
  end
  resources :orders do
  member do
    post :pay_with_alipay
    post :pay_with_wechat
    post :apply_to_cancel
  end
  end
  namespace :account do
    resources :favorites
    resources :orders
  end


end
