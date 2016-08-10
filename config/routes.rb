Rails.application.routes.draw do
  namespace :admin do
    resources :products do
      member do
        post :publish
        post :hide
      end
    end
  end
  devise_for :users

  resources :products
  root 'products#index'

  namespace :admin do
    resources :users do
      member do
        post :admin
        post :user
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
