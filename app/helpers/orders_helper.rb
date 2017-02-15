module OrdersHelper
	def render_order_paid_state(order)
		if order.is_paid?
			"Payed"
		else
			"Has not Payed"
		end
	end
end
