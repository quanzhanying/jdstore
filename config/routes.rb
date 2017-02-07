Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end
  root "products#index"
end
