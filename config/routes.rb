Rails.application.routes.draw do
  root 'product#index'
  devise_for :users
  root 'welcome#index'

  namespace :admin do
    resources :products
  end

  resources :products
end
