module ItemsHelper

	def render_thumb_image_link(item)

		if item.image?
			link_to(image_tag(item.image.thumb.url, class: "img-rounded"), item_path(item))
		else
			link_to(image_tag("No_image_available.png", width: '200px', height: '200px'), item_path(item))
		end
	end

	def render_medium_image_link(item)

		if item.image?
			link_to(image_tag(item.image.medium.url, class: "img-rounded"), item_path(item))
		else
			link_to(image_tag("No_image_available.png", width: '200px', height: '200px'), item_path(item))
		end
	end


	def render_add_to_favorites_botton(item)
		if current_user && !current_user.admin?
			if current_user.favorited_items.include?(item)
				link_to("Unlike", removeFromFavorites_customer_favorite_path(item), method: :put, class: "btn btn-sm btn-default")
			else
				link_to("Like", addToFavorites_customer_favorite_path(item), method: :post, class: "btn btn-sm btn-default")
			end
		end
	end


end
