Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  namespace :admin do
    resources :products do
      member do
        post :publish
        post :hide
      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    member do
      delete :delete_products
      delete :delete_cart_item
    end
  end

end
