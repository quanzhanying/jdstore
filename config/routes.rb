Rails.application.routes.draw do

  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  namespace :admin do
    resources :products do
      member do
        patch :move_up
        patch :move_down
      end
    end
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

  resources :cart_items

  resources :orders

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'welcome#index'
  root 'products#index'
end
