Rails.application.routes.draw do
  root 'welcome#index'

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


  resources :welcome do

  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  devise_for :users
  root 'welcome#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # 改着前端设计的细节突然就发现这个无法运作...可以是因为我删掉了
  # <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
  # 将上一行代码从 layouts/application.html.erb里面删掉的缘故...加入这个devise_scope后解决

  resources :cart_items

  resources :carts do
    collection do
      delete :clean
      post :checkout
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
   resources :orders
  end

end
