Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders do
    member do
      post :pay_with_wechat
      post :pay_with_alipay
      post :maker_payment
      post :ship
      post :deliver
      post :return_good
      post :cancell_order
    end
  end

  resources :carts do
    collection do
      post :checkout
    end
  end
  resources :cart_items


  resources :products do
    member do
      post :add_to_cart
    end
  end

  namespace :account do
    resources :orders do
      member do
        post :make_payment
        post :ship
        post :deliver
        post :return_good
        post :cancell_order
      end
    end
  end

  namespace :admin do
    resources :orders do
      member do
        post :make_payment
        post :ship
        post :deliver
        post :return_good
        post :cancell_order
      end
    end
    resources :products do
      member do
        post :publish
        post :hide
      end
    end
  end
  root 'products#index'
end
