Rails.application.routes.draw do
  resources :categories
  root 'welcome#index'



  resources :orders

  devise_for :users, controllers: { sessions: 'users/sessions' }
  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :products

  resources :cart_items

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :account do
    resources :orders
  end
end
