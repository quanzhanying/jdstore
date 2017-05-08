Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
     resources :products
     resources :categories
   end

   resources :products do
     member do
       post :add_to_cart
     end
   end
     

  root 'welcome#index'
end
