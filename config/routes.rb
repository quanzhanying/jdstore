Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items do
    member do
      post :add_to_cart
    end
  end

  namespace :admin do

  	resources :items

  end

  namespace :customer do

  	resources :favorites do

      member do
        post :addToFavorites
        post :removeFromFavorites
      end
      
    end

  end

  root "items#index"
  
end
