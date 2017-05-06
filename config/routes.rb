Rails.application.routes.draw do
  root 'products#index'
  devise_for :users
  namespace :admin do
   resources :products do
     post :publish
     post :hide
   end
  end

  resources :products

end
