Rails.application.routes.draw do
  devise_for :users
  resources :products do
    member do
      post :add_to_cart
      post :join
      post :quit
    end
  end

  namespace :account do
    resources :products
  end
  namespace :admin do
    resources :products
  end
  root "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
