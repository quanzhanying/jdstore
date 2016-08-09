Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
  end

  resources :carts do
    collection do
      delete :delete_all
      post :checkout
    end
    member do
      post :number_up
      post :number_down
    end
    resources :cart_item
  end

  resources :products do
    member do
      post :join
      post :quit
      post :add_to_cart
    end
    resources :posts
  end

  resources :orders

  namespace :account do
    resources :products
  end



  root 'products#index'

end
