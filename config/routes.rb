Rails.application.routes.draw do
  root 'products#index'
  devise_for :users
  namespace :admin do
    resources :products do
      member do
        post :add_to_cart
      end
    end
  end

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
