module ApplicationHelper
	
def show_product_image(product)
    link_to product_path(product) do
    if product.image.present?
      image_tag(product.image.thumb.url, class: "thumbnail")
    else
      image_tag("http://placehold.it/200x200&text=No Pic", class: "thumbnail")
    end
  end
end


end
