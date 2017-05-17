Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root 'welcome#index'

  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end

    collection do
      get :search
    end
  end

  resources :carts do
    # member do
    #   post :delete_cart_item
    # end
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items
  resources :orders

  namespace :account do
    resources :orders
  end

  root 'products#index'
end
