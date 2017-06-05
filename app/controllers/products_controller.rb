class ProductsController < ApplicationController

before_action :validate_search_key, only: [:search]


def add_to_favorite
@product = Product.find(params[:id])
@product.users << current_user
@product.save
redirect_to :back, notice:"成功加入收藏!"
end
def quit_favorite
@product = Product.find(params[:id])
@product.users.delete(current_user)
@product.save
redirect_to :back, alert: "成功取消收藏!"
end





  def index




    if params[:category].blank?
      @products = Product.all
      if params[:favorite] == "yes"
       @products = current_user.products
     end



    else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(:category_id => @category_id)
      if params[:favorite] == "yes"
       @products = current_user.products
     end

    end

  end

  def show
    @product = Product.find(params[:id])

    # 显示所有图片
    @product_images = @product.product_images.all




  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
        current_cart.add_product_to_cart(@product)
        flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end

    redirect_to :back
  end


  def search
      if @query_string.present?
        search_result = Product.ransack(@search_criteria).result(:distinct => true)
        @products = search_result.paginate(:page => params[:page], :per_page => 5 )
      end
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
