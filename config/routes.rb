Rails.application.routes.draw do

  devise_for :users

  resources :products
  root 'products#index'

  namespace :admin do
    resources :products
    resources :users do
      member do
        post :promote
        post :demote
    end
  end
end



end
