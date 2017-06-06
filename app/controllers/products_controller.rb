class ProductsController < ApplicationController

  before_action :authenticate_user! , only: [:favorete, :unfavorite]

  def index
    if params[:category].blank?
        @products = Product.all
    else
        @category_id = Category.find_by(name: params[:category]).id #先找到category_id
        @products = Product.where(category_id:  @category_id) #再根据category_id找到相对应的产品
    end
      if params[:searcher]
      @products = Product.search(params[:searcher])
    end
  end

  def new
       @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
       @product.category_id = params[:category_id]
  end

  def edit
       @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def update
   @product.category_id = params[:category_id]
  end


  def show
    @product =Product.find(params[:id])
    @photos = @product.photos.all
    @qr = RQRCode::QRCode.new(product_url(@product).to_s, :size => 6, :level => :h)
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

  def update_price
    product = Product.find(params[:id])

    response = RestClient.get "https://yunbi.com//api/v2/tickers/#{product.product_id}"
    # 因为我们之前保存过币种id的值的，现在可以调用啦！

    data = JSON.parse(response.body)

    product.update(:timestamp_at => data["at"],
                   :price_buy => data["ticker"]["buy"],
                   :price_sell => data["ticker"]["sell"],
                   :price_low => data["ticker"]["low"],
                   :price_high => data["ticker"]["high"],
                   :trade_vol => data["ticker"]["vol"],
                   :price_last => data["ticker"]["last"],
                   :price => data["ticker"]["last"],
                   :quantity => data["ticker"]["vol"])

    redirect_to :back
  end

  def favorite
    @product = Product.find(params[:id])
    if !current_user.is_member_of?(@product)
      current_user.favorite!(@product)
      redirect_to :back, notice: "已点赞宝贝！"
    end
  end

  def unfavorite
    @product = Product.find(params[:id])
    if current_user.is_member_of?(@product)
      current_user.unfavorite!(@product)
      redirect_to :back, notice: "已取消点赞！"
    end
  end


end
