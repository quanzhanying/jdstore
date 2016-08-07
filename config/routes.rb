Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  
  namespace :admin do
    resources :products
     resources :users do
       member do
         post :be_admin
         post :be_user
       end
     end
   end

  resources :products
end
