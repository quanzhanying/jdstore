class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]
  before_filter :authenticate_user! , only: [:new, :edit, :create, :update, :destroy, :favorite]
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy, :downvote, :upvote]

  def index
    @arraywhere = Array[["fruits","进口水果"],["aquatic","进口水产"],["meat","进口鲜肉"]]
    @arrayorder = Array[["hot","show_count desc"],["new","created_at desc"],["sale","sale desc"],["price","promotional"],["price-down","promotional  desc"],["review","reviews_count desc"]]
    if !params[:where].blank? && !@arraywhere.assoc(params[:where]).blank?
        where = params[:where]
        @w = @arraywhere.assoc(where)
        if !params[:order].blank? && !@arrayorder.assoc(params[:order]).blank?
          order = params[:order]
          @o = @arrayorder.assoc(order)
          @products = Product.where(:product_type => @w[1]).order(@o[1]).paginate(:page => params[:page], :per_page =>100)
        else
          @products = Product.where(:product_type => @w[1]).paginate(:page => params[:page], :per_page =>100)
        end
    else
      if !params[:order].blank? && !@arrayorder.assoc(params[:order]).blank?
        order = params[:order]
        @o = @arrayorder.assoc(order)
        @products = Product.order(@o[1]).paginate(:page => params[:page], :per_page =>100)
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
    @reviews = @product.reviews.order("id desc").limit(20)
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
      when "price-down"
        @products = search_result.order("promotional desc").paginate(:page => params[:page], :per_page =>100)
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
   @addresses = current_user.addresses.order("updated_at desc")
  end

  def favorite
    info = "$.globalMessenger().post({message:'加入收藏成功！',type:'info',hideAfter:3,showCloseButton:true,hideOnNavigate:true});"
    uninfo = "$.globalMessenger().post({message:'取消收藏成功！',type:'info',hideAfter:3,showCloseButton:true,hideOnNavigate:true});"
    @product = Product.find(params[:id])
    if !params[:fa].blank?
      favorite = params[:fa]
      case favorite
      when "favorite-p"
        if !current_user.is_favorite_of?(@product)
           current_user.favorite!(@product)
        end
          jq= "$('#favorite-item-"+@product.id.to_s+"').children('i').removeClass('fa-heart-o').addClass('fa-heart').html(' 已收藏');" +
              "$('#favorite-item-"+@product.id.to_s+"').attr('href','" + favorite_product_path(@product) + "?fa=unfavorite-p');" + info
          render :js => jq
      when "unfavorite-p"
        if current_user.is_favorite_of?(@product)
           current_user.unfavorite!(@product)
        end
          jq= "$('#favorite-item-"+@product.id.to_s+"').children('i').removeClass('fa-heart').addClass('fa-heart-o').html(' 收藏');" +
              "$('#favorite-item-"+@product.id.to_s+"').attr('href','" + favorite_product_path(@product) + "?fa=favorite-p');" + uninfo
          render :js => jq
      when "favorite-f"
        if !current_user.is_favorite_of?(@product)
           current_user.favorite!(@product)
        end
          jq= "$('#favorite-item-"+@product.id.to_s+"').children('i').removeClass('fa-heart-o').addClass('fa-heart');" +
              "$('#favorite-item-"+@product.id.to_s+"').attr('href','" + favorite_product_path(@product) + "?fa=unfavorite-f');" + info
          render :js => jq
      when "unfavorite-f"
        if current_user.is_favorite_of?(@product)
           current_user.unfavorite!(@product)
        end
          jq= "$('#favorite-item-"+@product.id.to_s+"').children('i').removeClass('fa-heart').addClass('fa-heart-o');" +
              "$('#favorite-item-"+@product.id.to_s+"').attr('href','" + favorite_product_path(@product) + "?fa=favorite-f');" + uninfo
          render :js => jq
      when "favorite-s"
        if !current_user.is_favorite_of?(@product)
           current_user.favorite!(@product)
        end
          jq= "$('#favorite-item-"+@product.id.to_s+"').html('已收藏');" +
              "$('#tm-count.tm-count').html('"+@product.favorite_products.count.to_s+"');" +
              "$('#favorite-item-"+@product.id.to_s+"').attr('href','" + favorite_product_path(@product) + "?fa=unfavorite-s');" + info
          render :js => jq
      when "unfavorite-s"
        if current_user.is_favorite_of?(@product)
           current_user.unfavorite!(@product)
        end
          jq= "$('#favorite-item-"+@product.id.to_s+"').html('加入收藏');" +
              "$('#tm-count.tm-count').html('"+@product.favorite_products.count.to_s+"');" +
              "$('#favorite-item-"+@product.id.to_s+"').attr('href','" + favorite_product_path(@product) + "?fa=favorite-s');" + uninfo
          render :js => jq
      when "favorite-c"
        if !current_user.is_favorite_of?(@product)
           current_user.favorite!(@product)
        end
          jq= "$('#favorite-item-"+@product.id.to_s+"').addClass('cart-list-fa').html('已收藏');" +
              "$('#favorite-item-"+@product.id.to_s+"').attr('href','" + favorite_product_path(@product) + "?fa=unfavorite-c');" + info
          render :js => jq
      when "unfavorite-c"
        if current_user.is_favorite_of?(@product)
           current_user.unfavorite!(@product)
        end
          jq= "$('#favorite-item-"+@product.id.to_s+"').removeClass('cart-list-fa').html('加入收藏');" +
              "$('#favorite-item-"+@product.id.to_s+"').attr('href','" + favorite_product_path(@product) + "?fa=favorite-c');" + uninfo
          render :js => jq
      end

    end
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
