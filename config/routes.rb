Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :users do
      member do
        post :master
        post :guest
      end
    end
    resources :products
  end

  resources :products
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
