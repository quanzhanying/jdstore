Rails.application.routes.draw do
  namespace :admin do
    resources :products
  end

  resources :products

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
end
