Rails.application.routes.draw do
  mount ChinaCity::Engine => '/china_city'
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  namespace :admin do
    resources :categories
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
    resources :products do
      member do
        patch :move_up
        patch :move_down
      end
    end
  end

  resources :products do
    resources :reviews

    collection do
      get :search
    end
    member do
      post :add_to_cart
      post :instant_buy
      post :join
      post :quit
      put "like", to: "products#upvote"
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items do
    member do
      post :add_quantity
      post :remove_quantity
    end
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :users
    resources :orders
    resources :products
  end

  get 'about' => 'welcome#about'
  get 'life' => 'welcome#life'

end
