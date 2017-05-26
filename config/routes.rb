Rails.application.routes.draw do
  devise_for :users

namespace :admin do
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

resources :products do
  member do
    post :add_to_cart
    put :favorite

  end
  collection do
      get :search
      get :category1
      get :category2
      get :category3
      get :category4
      get :category5
  end
end
resources :favorite

resources :carts do
  collection do
    delete :clean
      post :checkout
  end
end

namespace :account do
  resources :orders
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
root 'products#index'

end
