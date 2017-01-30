Rails.application.routes.draw do
  root "admin/products#index"
  #root "welcome#index"

  namespace :admin do
	  resources :products
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
