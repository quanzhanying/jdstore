Rails.application.routes.draw do
  devise_for :users #default exist

  namespace :admin do
    resources :products
    resources :users do
      member do
        post :change_to_admin
        post :change_to_user
      end
    end
  end


  resources :products

  root 'products#index'
end
