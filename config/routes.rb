Rails.application.routes.draw do
  devise_for :users
  resources :products
  namespace :admin do
    resources :products
  end

resources :carts do
  member do
    post :remove_item_from_cart
  end
end

resources :products do
  member do
    post :add_to_cart
  end
end
  root"products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
