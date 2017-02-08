Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
     resources :products
  end

  resources :products do
    memder do
      post :add_to_cart
    end
  end

  root 'products#index'

end

 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
