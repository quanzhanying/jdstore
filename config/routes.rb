Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'

  resources :carts do
    collection do
      delete :clean
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :cart_items do
    member do
      post :add_quantity
      post :delete_quantity
    end
  end

  namespace :admin do
    resources :products
  end

end
