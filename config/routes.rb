Rails.application.routes.draw do

  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  namespace :admin do
    resources :categories
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
  end

  namespace :account do
    resources :orders
    resources :favorites
  end

  resources :products do
    member do
      post :add_to_cart
      # post :favorite
      post :like
      post :unlike
    end

    collection do
      get :search
      get :search1
      get :search2
      get :search3
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  # root 'products#index'
end
