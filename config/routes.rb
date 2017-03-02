Rails.application.routes.draw do
  devise_for :users

  root "welcome#index"

  get 'about' => 'welcome#about'

  namespace :admin do
    resources :products do
      member do
        post :publish
        post :hidden
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
    resources :chefs do
      member do
        post :publish
        post :hidden
      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
      post :follow_dish
      post :unfollow_dish
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
      post :apply_to_return
    end
  end

  namespace :account do
    resources :orders
    resources :favorchefs
  end

  resources :chefs do
    member do
      post :add_to_cart
      post :follow
      post :unfollow
    end
    resources :chef_comments, only: [:new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
