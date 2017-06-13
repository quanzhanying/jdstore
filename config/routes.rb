Rails.application.routes.draw do
  namespace :admin do
   resources :products
  end

  root 'products#index'
  devise_for :users
  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end


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
  resources :orders

end
