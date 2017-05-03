Rails.application.routes.draw do
  devise_for :users
  resources :products
root 'products#index'

namespace :admin do
	resources :products
end

end
