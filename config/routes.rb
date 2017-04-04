Rails.application.routes.draw do

    root 'products#index'

    devise_for :users
    namespace :admin do
        resources :products
    end

    resources :products

end
