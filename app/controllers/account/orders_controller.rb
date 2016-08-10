class Account::OrdersController < ApplicationController

  def index
    @id = current_user.id
    @orders = Order.find_by_sql("select * from orders where orders.user_id = #{@id}")

  
  end

end
