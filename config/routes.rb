Rails.application.routes.draw do


  devise_for :users

  resources :products
  resources :welcome

  namespace :admin do
    resources :users do
      member do
        post :administrator
        post :consumer
      end
    end

    resources :products
  end

  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
