Rails.application.routes.draw do
    devise_for :users
  
	root 'products#index'

	namespace :admin do
		resources :products
	end

	resources :products do
		member do
			post :add_to_cart
		end
	end

	resources :carts do
		collection do
			delete :clean
			post :checkout
		end
	end

	resources :cart_items

	resources :orders do
		member do
			post :pay_with_alipy
			post :pay_with_wechat
		end
	end

	namespace :account do
		resources :orders
	end
end
