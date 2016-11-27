Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	# post '/add_to_cart/:product_id' => 'cart#add_to_cart', :as => 'add_to_cart'

	namespace :admin do
		resources :products
		resources :orders do
			member do
				post :admin_cancel_order
				post :admin_ships
			end
		end
	end

	resources :orders do
		member do
			post :pay_with_wechat
			post :pay_with_alipay
			post :ask_cancel
			post :user_received
			post :user_returns
		end
	end

	namespace :account do
		resources :orders
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



	root 'products#index'

end
