Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products

  namespace :admin do
    resources :users do
      member do
        post :change_to_admin
        post :change_to_user
      end
    end

    resources :products
  end
  root "products#index"
end
