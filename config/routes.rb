Rails.application.routes.draw do
  root 'products#index'
  namespace :admin do
    resources :products
  end
  devise_for :users

  resources :products

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
