Rails.application.routes.draw do
  namespace :admin do
   resources :products
  end

  root 'products#index'
  devise_for :users
  namespace :admin do
    resources :products
  end

  resources :products

end
