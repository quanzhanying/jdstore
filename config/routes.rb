Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  resources :carts do
    collection do
      delete :clean
    end
  end
  
  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end



end
