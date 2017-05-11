Rails.application.routes.draw do
  namespace :admin do
    resources :products
  end

  devise_for :users
  root 'products#index'

  resources :products
end
