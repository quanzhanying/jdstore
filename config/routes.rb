Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  get 'products' => 'products#index'
  get 'welcome' => 'welcome#index'
  get 'about' => 'welcome#about'
  get 'how' => 'welcome#how'
  get 'branch' => 'welcome#branch'

  namespace :admin do
   resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end
end
