Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :welcome

  namespace :admin do
    resources :products
  end
  root "products#index"

  resources :products

  namespace :admin do
    resources :user_mg do
      member do
        post :change_admin

      end
    end
  end
end
