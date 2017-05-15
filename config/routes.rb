Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root 'welcome#index'

  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
    collection do
      get :search
    end
  end

  resources :carts do
   collection do
     delete :clean
   end
  end

  resources :cart_items

end
