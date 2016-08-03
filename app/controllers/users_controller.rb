class UsersController < ApplicationController
  before_action :authenticate_user!


  def bookmarks
    @products = current_user.bookmarked_products
  end

  def like
    @product = Product.find(params[:id])

    if !current_user.is_bookmark_of?(@product)
      current_user.add_bookmark!(@product)
      flash[:notice] = "Successfully like the product."
    else
      flash[:warning] = "You are allready liked."
    end

    # render "products/index"
    location = params[:location]
    if location && "bookmarklist"
      redirect_to "bookmarks"
    else
        redirect_to "/"
    end


    # if @product.like!
    #   flash[:notice] = "Successfully like the product."
    #   render index
    # else
    #   flash[:alert] = "Faild like the product."
    #   render index
    # end
  end

  def unlike
    @product = Product.find(params[:id])

    if current_user.is_bookmark_of?(@product)
      current_user.removebookmark!(@product)
      flash[:alert] = "Successfully unlike the product."
    else
      flash[:alert] = "You haven't like the product."
    end

    location = params[:location]
    if location && "bookmarklist"
      redirect_to bookmarks_user_path
    else
        redirect_to "/"
    end
  end

end
