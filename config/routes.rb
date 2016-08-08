Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    member do
      post :delete_item
    end
  end
  #   collection do
  #     delete :clean
  #   end
  # end

  namespace :admin do
    resources :products

    resources :users do
      member do
        post :change_to_admin
        post :change_to_user
      end
    end
  end

  root "products#index"
end
