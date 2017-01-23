Rails.application.routes.draw do
  devise_for :users

  resources :products

  namespace :admin do
    resources :products
  end

  root 'welcome#index'
end
