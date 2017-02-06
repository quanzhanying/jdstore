Rails.application.routes.draw do
root 'products#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
namespace :admin do
  resources :products

end
resources :products do
    member do
      post :add_to_cart

    end
  end

resources :products
 resources :carts
root 'welcome#index'
end
