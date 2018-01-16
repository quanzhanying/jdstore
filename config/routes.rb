Rails.application.routes.draw do
  root 'products#index'
  devise_for :users

  namespace :admin do
    resources :products do
      member do
        post :publish
        post :hide
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
    end
  end

  resources :cart_items

end
