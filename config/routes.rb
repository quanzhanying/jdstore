Rails.application.routes.draw do

  devise_for :users
  root 'leading#index'

end
