Rails.application.routes.draw do
root 'products#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
namespace :admin do
  resources :products

end
namespace :account do
  resources :orders
end
resources :products do
    member do
      post :add_to_cart

    end
  end
  resources :carts do
    collection do
      delete :clean
    end
  end
  resources :carts do
      collection do
        post :checkout
      end
    end

resources :products
 resources :carts
 resources :orders
root 'welcome#index'
end
