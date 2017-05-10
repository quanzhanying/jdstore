Rails.application.routes.draw do
  root 'products#index'
  namespace :admin do
    resources :products
  end

  devise_for :users
  resources :products do
    member do
      post :add_to_cart
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :carts do
    collection do
      delete :clean
    end
  end

  resources :cart_items
end
