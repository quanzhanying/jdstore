Rails.application.routes.draw do
  root 'products#index'
  devise_for :users
  namespace :admin do
   resources :products do
     member do
       post :publish
       post :hide
     end
   end
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

end
