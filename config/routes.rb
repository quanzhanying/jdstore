Rails.application.routes.draw do
  devise_for :users
  resources :products do
    member do
      post :add_to_cart
      post :join
      post :quit
    end
  end
  resources :carts do
      member do
        delete :minusitem
        post :upitem
        post :downitem
      end
      collection do
        delete :delall
        post :checkout
      end
  end
  resources :orders do
    member do
      post :pay_with_wechat
      post :pay_with_alipay
    end
  end

  namespace :account do
    resources :products
    resources :orders
  end
  namespace :admin do
    resources :products
    resources :users do
      member do
        post :publish
        post :hide
      end
    end
  end
  root "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
