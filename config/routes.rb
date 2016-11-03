Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do

    resources :products do
      member do
        put :publish
        put :private
      end
    end

    resources :users do
      member do
        put :cgadmin
        put :cguser
      end
    end

    resources :orders do
      member do
        put :order_to_cancell
        put :order_to_shipping
      end
    end
    
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      post :clear_cart
      get :checkout
      # put :item_increase
      # put :item_decrease
      resources :cart_items do
        member do
          put :item_increase
          put :item_decrease
        end
      end
      # post :rm_from_cart
    end
  end


  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      get :paysuccess
      get :payfailed
    end
  end



  namespace :account do
    resources :orders do
      post :apply_cancell_order
    end
  end
  
  root 'products#index'

end
