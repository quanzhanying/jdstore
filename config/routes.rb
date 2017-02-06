Rails.application.routes.draw do
  root 'products#index'
  namespace :admin do
    resources :products
  end

  resources :products

  devise_for :users
  root 'welcome#index'
end
