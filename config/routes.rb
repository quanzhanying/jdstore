Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get '/info' => 'info#index'
  devise_for :users
  # devise_for :users, :controllers => {
  #   :sessions      => "users/sessions",
  #   :registrations => "users/registrations",
  #   :passwords     => "users/passwords",
  # }
  resources :products do
    member do
      post :add_to_cart
      post :favorite
      post :unfavorite
      post :instant_buy
    end
    collection do
      get :search
    end
    resources :reviews, only: [:new, :create]
  end

  namespace :admin do
    resources :exams do
      member do
          post :a
          post :a1

          post :b
          post :b1

          post :c
          post :c1

          post :d
          post :d1

          post :e
          post :e1

          post :f
          post :f1
      end
    end
    resources :categories
    resources :products
    resources :posts
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end

  resources :answers do
  post :ture_answer
end

resources :answers

resources :exams do
  collection do
    post :option
    post :check_answer
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
    end
  end

  namespace :account do
    resources :orders
  end

  resources :favorites

  resources :choices do
    member do
        post :aa
        post :aa1

        post :bb
        post :bb1

        post :cc
        post :cc1

        post :dd
        post :dd1

        post :ee
        post :ee1

        post :ff
        post :ff1
      end
  end

  root "welcome#index"

  get 'about' => 'welcome#about'
end
