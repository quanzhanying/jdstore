Rails.application.routes.draw do

  devise_for :users


  namespace :admin do
    resources :products       #后台上架网址 admin/products
  end

  root 'products#index'

  resources :products do      #前台product
    member do
      post :add_to_cart
    end
  end

  resources :carts do         #购物车明细
    collection do
      delete :clean           #清空购物车
    end
  end

  resources :cart_items



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
