Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "stores/products#index"
  resources :products, only: [:index, :show]

  namespace :stores do
    resources :products
  end
end
