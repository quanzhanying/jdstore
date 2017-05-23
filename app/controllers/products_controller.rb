class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]
  before_filter :authenticate_user! , only: [:new, :edit, :create, :update, :destroy, :favorite]
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy, :downvote, :upvote]


  def index
    @products = Product.all.paginate(:page => params[:page], :per_page =>8)

  end

  def show
     @product = Product.find(params[:id])
     @product.show_count += 1
     @product.save
    end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
        current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将#{@product.title} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end
    redirect_to :back
  end

  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 8 )
    end
  end

  def favorite
@product = Product.find(params[:id])
type = params[:type]
if type == "favorite"
current_user.favorite_products << @product
redirect_to :back

elsif type == "unfavorite"
current_user.favorite_products.delete(@product)
redirect_to :back

else
redirect_to :back
end
end

def upvote
   @product = Product.find(params[:id])

    if !current_user.is_voter_of?(@product)
      current_user.upvote!(@product)
    end

    redirect_to :back
  end

  def downvote
    @product = Product.find(params[:id])

    if current_user.is_voter_of?(@product)
      current_user.downvote!(@product)
    end
    redirect_to :back
  end


  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end


  def search_criteria(query_string)
    { :title_cont => query_string }
  end
end
