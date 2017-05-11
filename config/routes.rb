Rails.application.routes.draw do
   root 'welcome#index'
   namespace :admin do
      resources :products
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
