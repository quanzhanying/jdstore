module ProductsHelper

  def index
    @products = Product.all
  end
end
