Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
  end
  root 'products#index'

  resources :products do
    member do
      post :add_to_cart
    end
  end
<<<<<<< HEAD
=======
  resources :carts do
    collection do
      delete :clean
    end
  end
  resources :cart_items
>>>>>>> story4
end
