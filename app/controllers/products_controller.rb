class ProductsController < ApplicationController
  def index
    @products = Product.all
    if params[:searcher]
      @products = Product.search(params[:searcher])
    end
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

    response = RestClient.get "https://yunbi.com//api/v2/tickers/#{product.product_id}" # 因为我们之前保存过币种id的值的，现在可以调用啦！

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

end
