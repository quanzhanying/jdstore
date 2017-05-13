Rails.application.routes.draw do
  root 'welcome#index'
  root 'products#index'
  root 'ours#index'
  devise_for :users


  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :ours
end
