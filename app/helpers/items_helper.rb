module ItemsHelper

	def render_image_link(item)

		if item.image?
			link_to(image_tag(item.image.thumb.url, class: "img-rounded"), item_path(item))
		else
			link_to(item.title, item_path(item))
		end
	end
end
