Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :carts
  resources :cart_items

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
  root 'products#index'
end
