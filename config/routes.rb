Rails.application.routes.draw do
  root 'products#index'
  devise_for :users
  namespace :admin do
  end
    resources :products do
      member do
        post :add_to_cart
      end
  end

  resources :products
  resources :carts

end
