Rails.application.routes.draw do
  devise_for :users
  resources :products do
    member do
      post :add_to_cart
      post :join
      post :quit
    end
  end
  resources :carts do
      member do
        delete :minusitem
      end
      collection do
        delete :delall
      end
  end


  namespace :account do
    resources :products
  end
  namespace :admin do
    resources :products
    resources :users do
      member do
        post :publish
        post :hide
      end
    end
  end
  root "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
