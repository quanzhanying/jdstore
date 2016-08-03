Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items

  namespace :admin do

  	resources :items

  end

  root "items#index"
  
end
