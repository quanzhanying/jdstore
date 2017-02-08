Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations" }
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'welcome#index'

resources :products do

member do
  post :add_to_cart
end
end

namespace :admin do
  resources :products
end

resources :carts do
  collection do
    delete :clean
    post :checkout
  end
end

resources :orders
resources :cart_items

namespace :account do  
    resources :orders

end

end
