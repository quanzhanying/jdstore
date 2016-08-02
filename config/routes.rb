Rails.application.routes.draw do
  devise_for :sellers
  devise_for :users

  namespace :seller do
  	resources :items
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
end
