Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
  end
    root 'products#index'
    devise_for :users
    namespace :admin do
      resources :products
    end
    resources :products 
end
