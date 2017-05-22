class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]
  before_filter :authenticate_user! , only: [:new, :edit, :create, :update, :destroy, :favorite]



  def index
    @products = Product.all.paginate(:page => params[:page], :per_page =>100)

  end

  def show
     @product = Product.find(params[:id])
     @product.show_count += 1
     @product.save
     @products_see = Product.where(:product_type => @product.product_type).order("show_count desc").limit(15)
     @products_hot = Product.where(:product_type => @product.product_type, :hot => true).limit(6)
    end

  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 8 )
    end
  end




  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "")
    if params[:q].present?
      @search_criteria = {
        title_or_deccription: @query_string
      }
  end


  def search_criteria(query_string)
    { :title_cont => query_string }
  end
end

private

def product_params
  params.require(:product).permit(:title, :description)
end
end
