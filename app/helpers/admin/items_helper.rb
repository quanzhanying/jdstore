module Admin::ItemsHelper


  def on_off_shelf(item)
    if item.is_available
      link_to("Off Shelf", hide_admin_item_path(item), :method => :post)
    else
      link_to("On Shelf", publish_admin_item_path(item), :method => :post)
    end

  end
end
