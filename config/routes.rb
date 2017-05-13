Rails.application.routes.draw do
  devise_for :users
  resources :products
  root 'products#index'

  namespace :admin do
    resources :products
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
