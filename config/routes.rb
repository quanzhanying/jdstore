Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :productions
  end
  root "welcome#index"
end
