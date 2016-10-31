Rails.application.routes.draw do


  devise_for :users

  resources :products do
    member do
      post :add_to_cart
      post :hide
      post :publish
    end
  end

  namespace :admin do
    resources :users do
      member do
        post :administrator
        post :consumer
      end
    end

    resources :products
    #resources :welcome

  end

  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
