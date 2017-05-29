class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]
  before_filter :authenticate_user! , only: [:new, :edit, :create, :update, :destroy, :favorite]
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy, :downvote, :upvote]

  def index
    case params[:where]
    when "进口水果"
      case params[:order]
      when "hot"
        @products = Product.where(:product_type => "进口水果").order("show_count desc").paginate(:page => params[:page], :per_page =>100)
      when "new"
        @products = Product.where(:product_type => "进口水果").order("created_at desc").paginate(:page => params[:page], :per_page =>100)
      when "sale"
        @products = Product.where(:product_type => "进口水果").order("sale desc").paginate(:page => params[:page], :per_page =>100)
      when "price"
        @products = Product.where(:product_type => "进口水果").order("promotional").paginate(:page => params[:page], :per_page =>100)
      else
        @products = Product.where(:product_type => "进口水果").paginate(:page => params[:page], :per_page =>100)
      end
    when "进口水产"
      case params[:order]
      when "hot"
        @products = Product.where(:product_type => "进口水产").order("show_count desc").paginate(:page => params[:page], :per_page =>100)
      when "new"
        @products = Product.where(:product_type => "进口水产").order("created_at desc").paginate(:page => params[:page], :per_page =>100)
      when "sale"
        @products = Product.where(:product_type => "进口水产").order("sale desc").paginate(:page => params[:page], :per_page =>100)
      when "price"
        @products = Product.where(:product_type => "进口水产").order("promotional").paginate(:page => params[:page], :per_page =>100)
      else
        @products = Product.where(:product_type => "进口水产").paginate(:page => params[:page], :per_page =>100)
      end
    when "进口鲜肉"
      case params[:order]
      when "hot"
        @products = Product.where(:product_type => "进口鲜肉").order("show_count desc").paginate(:page => params[:page], :per_page =>100)
      when "new"
        @products = Product.where(:product_type => "进口鲜肉").order("created_at desc").paginate(:page => params[:page], :per_page =>100)
      when "sale"
        @products = Product.where(:product_type => "进口鲜肉").order("sale desc").paginate(:page => params[:page], :per_page =>100)
      when "price"
        @products = Product.where(:product_type => "进口鲜肉").order("promotional").paginate(:page => params[:page], :per_page =>100)
      else
        @products = Product.where(:product_type => "进口鲜肉").paginate(:page => params[:page], :per_page =>100)
      end
    else
      case params[:order]
      when "hot"
        @products = Product.all.order("show_count desc").paginate(:page => params[:page], :per_page =>100)
      when "new"
        @products = Product.all.order("created_at desc").paginate(:page => params[:page], :per_page =>100)
      when "sale"
        @products = Product.all.order("sale desc").paginate(:page => params[:page], :per_page =>100)
      when "price"
        @products = Product.all.order("promotional").paginate(:page => params[:page], :per_page =>100)
      else
        @products = Product.all.paginate(:page => params[:page], :per_page =>100)
      end
    end
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
      case params[:order]
      when "hot"
        @products = search_result.order("show_count desc").paginate(:page => params[:page], :per_page =>100)
      when "new"
        @products = search_result.order("created_at desc").paginate(:page => params[:page], :per_page =>100)
      when "sale"
        @products = search_result.order("sale desc").paginate(:page => params[:page], :per_page =>100)
      when "price"
        @products = search_result.order("promotional").paginate(:page => params[:page], :per_page =>100)
      else
        @products = search_result.paginate(:page => params[:page], :per_page =>100)
      end
    end
  end

  def checkout
   @order = Order.new
   #render :js =>  params[:num]
   @num = params[:num].to_i
   @product = Product.find(params[:id])

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
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "")
    if params[:q].present?
      @search_criteria = {
        title_cont: @query_string
      }
    end
  end

  def search_criteria(query_string)
    { :title_cont => query_string }
  end



  private

end
