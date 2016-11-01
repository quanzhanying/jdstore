Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	post '/add_to_cart/:product_id' => 'cart#add_to_cart', :as => 'add_to_cart'

	namespace :admin do
		resources :products
	end

	resources :products do
		member do
			post :add_to_cart
			post :remove_from_cart
		end
	end

	resources :carts do
		collection do
			post :clear_cart
			post :checkout
		end
	end

	resources :cart_item
	resources :orders

	root 'products#index'

end
