Rails.application.routes.draw do
  resources :categories
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
    member do
      post :add_to_cart
      post :add_to_favorite
      post :quit_favorite
    end
    collection do
      get :search
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
      post :pay_with_wechat
      post :pay_with_alipay
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :orders
  end

  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
  }


  root 'welcome#index'
end
