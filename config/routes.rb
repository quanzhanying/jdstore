Rails.application.routes.draw do
  namespace :admin do
    resources :products
  end
# rails g controller admin/products
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products
  root 'products#index'
#root 'admin/products#index'
end
