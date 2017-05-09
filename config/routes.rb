Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

end
