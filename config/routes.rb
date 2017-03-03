Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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


  resources :products do
    resources :reviews
     member do
       post :add_to_cart
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
       post :pay_with_alipay
       post :pay_with_wechat
       post :apply_to_cancel
     end
   end

  namespace :account do
    resources :products
    resources :orders
  end
end
