Rails.application.routes.draw do
  get 'mailer/OrderMailer'
  devise_for :users

  resources :mailers do
    collection do
      post :notify_order_placed
      post :notify_paid
      post :notify_shipped
      post :notify_order_cancelled
      post :notify_good_returned

    end
  end
  resources :cart_items do
    member do
      post :increment_quantity
      post :decrement_quantity
      post :title
      post :price
    end
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :shipping
      post :shipped
      post :cancell
      post :cancelled
    end
  end



  resources :carts do
    collection do
      post :checkout
    end
    member do
      post :add_product_to_cart
    end
  end

  namespace :admin do
    resources :products
    resources :orders do
      member do
        post :notify_order_placed
        post :cancell
        post :shipped
        post :shipping
        post :cancelled
      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
      delete :destroy_to_cart
    end
  end

  namespace :account do
    resources :products
    resources :orders
  end

  root 'products#index' # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
