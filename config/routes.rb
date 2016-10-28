Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  # get 网址 , to controller#action
  # get 'no_result', to:'products#no_result'

  namespace :admin do
  	resources :products
  end

  resources :products, only: [:show, :index] 
  


end
