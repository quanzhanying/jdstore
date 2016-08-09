Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products do
      member do
        get :publish
        get :hide
      end
    end
    resources :uses do
      member do
        get :upgrade_to_admin
        get :degrade_to_user
      end
    end
    resources :orders do
      member do
        post :cancle_order
        post :ship_order
      end
    end
  end

  namespace :account do
    resources :orders do
      post :apply_cancle_order
      post :apply_return_good
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :users do
    member do
      get :like
      get :unlike
    end
    collection do
      get :bookmarks
    end
  end

  resources :carts do
    member do
      post :up_cart_item_count
      post :down_cart_item_count
      post :edit_cart_item_count
    end
    collection do
      post :del_cart_items
      post :check_out
    end
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end

  root 'products#index'
end
