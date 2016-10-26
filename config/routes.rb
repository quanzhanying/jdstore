Rails.application.routes.draw do
 devise_for :users
 namespace :admin do
   resources :products
 end

  namespace :admin do
    resources :user_group do
      post :admin
      post :user
     end
    end
  end

 root 'products#index'
end
