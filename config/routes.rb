Rails.application.routes.draw do
  root 'products#index'
  devise_for :users
  namespace :admin do
 end

 resources :products
end
