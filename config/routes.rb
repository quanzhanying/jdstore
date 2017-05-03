Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :products
  end
  resources :products
  root 'products#index'
end
