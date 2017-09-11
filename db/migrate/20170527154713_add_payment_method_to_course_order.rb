class AddPaymentMethodToCourseOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :course_orders, :payment_method, :string
  end
end
