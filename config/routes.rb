Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :products
    resources :users do
      member do
        post :admin
        post :user
      end
    end
  end

  resources :products
  root 'products#index'

end
