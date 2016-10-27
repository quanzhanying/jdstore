Rails.application.routes.draw do
  devise_for :users
  resources :products

  namespace :admin do
    resources :products
  end

  resources :products do
    resources :photos
  end 
root 'products#index'  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
