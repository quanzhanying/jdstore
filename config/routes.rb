Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :products
  end
  get "welcome/index"
  root  "welcome#index"
end
