Rails.application.routes.draw do
   namespace :admin do
   resources :products
 end

  devise_for :users

  resources :products do
    member do
      post :add_to_cart
    end
  end

  root 'products#index'
end
