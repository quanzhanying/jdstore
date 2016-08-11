Rails.application.routes.draw do
  devise_for :users
  resources :products do
    member do
      post :add_to_cart
    end
  end
  namespace :admin do
    resources :products do
      member do
        post :publish
        post :hide
      end
    end
  end

  resources :shipping_cart do
    member do
      post :destroy_all_items
      post :current_cart_add_item
      post :current_cart_delete_item
    end
    collection do
      post :checkout
    end
  end

  resources :orders

  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
