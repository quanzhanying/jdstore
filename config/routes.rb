Rails.application.routes.draw do
  devise_for :user,  controllers: {
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root  'welcome#index'

  namespace  :admin  do
    resources  :products  do
      member  do
        post  :publish
        post  :hide
      end
    end
    resources  :orders  do
      member  do
        post  :cancel
        post  :ship
        post  :shipped
        post  :return
      end
    end
  end

  resources  :products  do
    collection  do
      get  :search
    end
    member  do
      post  :add_to_cart
    end
  end

  resources  :carts   do
    collection  do
     delete  :clean
      post  :checkout
    end
  end

 resources   :cart_items

 resources   :orders  do
   member  do
     post  :pay_with_alipay
     post  :pay_with_wechat
     post  :apply_to_cancel
   end
 end

 namespace  :account   do
   resources   :users   #  新增［用户中心］的相关路径
   resources   :orders
 end

end
