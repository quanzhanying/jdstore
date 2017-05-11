Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  # root 'admin/products#index'
  namespace :admin do
      resources :products
  end
end
