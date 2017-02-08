Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations" }
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'welcome#index'

resources :products

namespace :admin do
  resources :products
end
end
