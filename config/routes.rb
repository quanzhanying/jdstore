Rails.application.routes.draw do
  root 'products#index'
  devise_for :user
  namespace :admin do
    resources :products
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
end
