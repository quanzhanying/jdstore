Rails.application.routes.draw do
  devise_for :users


  resources :cart_item


  namespace :admin do
    resources :items do
      member do
        post :publish
        post :hide
      end
    end

    resources :users do
      member do
        post :Adm
        post :Use
      end
    end
  end

  resources :items do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      post :checkout
    end
  end

namespace :accounts do
  resources :orders do
    member do
      post :pay_with_wechat
      post :pay_with_alipay
    end
  end
end


  root "items#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
