Rails.application.routes.draw do
  resources :brands
  resources :categories
  devise_for :users, controllers: { sessions: 'users/sessions' }
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
  resources :products do
    member do
      post :add_to_cart
      post :add_to_favorite  #收藏商品功能
      post :cancel_favorite  #取消收藏功能
      put "like", to: "products#upvote"  #点赞共呢功能
    end
    collection do
      get :search
    end
  end
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
  namespace :account do
   resources :orders
   resources :products
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
