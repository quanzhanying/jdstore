Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :items
  end

  resources :items
  root "items#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
