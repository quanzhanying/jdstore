class CartsController < ApplicationController
    before_action :authenticate_user!

    def clean
       current_cart.clean!
       flash[:warning] = "已清空购物车"
       redirect_to carts_path
    end

end
