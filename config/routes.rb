Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts

  namespace :admin do
    resources :products

    resources :users do
      member do
        post :be_admin
      end
    end
  end

  root 'products#index'
end
