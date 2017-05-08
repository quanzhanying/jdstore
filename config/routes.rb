Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products do
    post :add_to_cart
  end

  namespace :admin do
    resources :products
  end

  root 'products#index'
end
