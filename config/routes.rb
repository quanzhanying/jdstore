Rails.application.routes.draw do
   namespace :admin do
   resources :products
 end

  devise_for :users

  resources :products

  root 'products#index'
end
