class ProductsController < ApplicationController

before_action :validate_search_key, only: [:search]
  def index
    @products = case params[:order]
    when 'by_clothes'
      Product.where(is_clothes: true).order('clothes DESC')
    when 'by_living'
      Product.where(is_living: true).order('living DESC')
    when 'by_eating'
      Product.where(is_eating: true).order('eating DESC')
    when 'by_walking'
      Product.where(is_walking: true).order('walking DESC')
    when 'by_bathing'
      Product.where(is_bathing: true).order('bathing DESC')
    when 'by_playing'
      Product.where(is_playing: true).order('clothes DESC')

    else
      Product.order('created_at DESC')
    end

    @q = Product.ransack(params[:q])
        @products = @q.result(distinct: true)
  end


  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
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
