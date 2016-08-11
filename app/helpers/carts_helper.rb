module CartsHelper

	def render_thumb_image_link(item)

		link_to item_path(item) do
			if item.image.present?
				image_tag(item.image.thumb.url, class: "img-rounded")
			else
				image_tag("No_image_available.png", width: '200px', height: '200px')
			end
		end

	end

	def render_cart_total_price(cart)
		cart.total_price
	end

end

              