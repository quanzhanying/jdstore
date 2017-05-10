# == Route Map
#
#                   Prefix Verb   URI Pattern                        Controller#Action
#         new_user_session GET    /users/sign_in(.:format)           devise/sessions#new
#             user_session POST   /users/sign_in(.:format)           devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)          devise/sessions#destroy
#            user_password POST   /users/password(.:format)          devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)      devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)     devise/passwords#edit
#                          PATCH  /users/password(.:format)          devise/passwords#update
#                          PUT    /users/password(.:format)          devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)            devise/registrations#cancel
#        user_registration POST   /users(.:format)                   devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)           devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)              devise/registrations#edit
#                          PATCH  /users(.:format)                   devise/registrations#update
#                          PUT    /users(.:format)                   devise/registrations#update
#                          DELETE /users(.:format)                   devise/registrations#destroy
#                     root GET    /                                  products#index
#           admin_products GET    /admin/products(.:format)          admin/products#index
#                          POST   /admin/products(.:format)          admin/products#create
#        new_admin_product GET    /admin/products/new(.:format)      admin/products#new
#       edit_admin_product GET    /admin/products/:id/edit(.:format) admin/products#edit
#            admin_product GET    /admin/products/:id(.:format)      admin/products#show
#                          PATCH  /admin/products/:id(.:format)      admin/products#update
#                          PUT    /admin/products/:id(.:format)      admin/products#update
#                          DELETE /admin/products/:id(.:format)      admin/products#destroy
#                 products GET    /products(.:format)                products#index
#                          POST   /products(.:format)                products#create
#              new_product GET    /products/new(.:format)            products#new
#             edit_product GET    /products/:id/edit(.:format)       products#edit
#                  product GET    /products/:id(.:format)            products#show
#                          PATCH  /products/:id(.:format)            products#update
#                          PUT    /products/:id(.:format)            products#update
#                          DELETE /products/:id(.:format)            products#destroy
#

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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
