Rails.application.routes.draw do
  root 'products#index'
  namespace :admin do
    resources :products
  end

    resources :products do
      member do
        post :add_to_cart
      end
    end

  devise_for :users
  root 'welcome#index'
  resources :cart_items

   resources :carts do
    collection do
      delete :clean
       post :checkout
    end
  end
   resources :orders  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   namespace :account do
    resources :orders
  end
end
