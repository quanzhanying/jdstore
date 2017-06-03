class Admin::ProductsController < AdminController

  def index
    if params[:category_id].blank?
    @products = Product.all
  else
    @products = Product.where(category_id: params[:category_id])
  end
end

def new
@product = Product.new
@categories = Category.all.map { |c| [c.name, c.id] }
end
def create
@product = Product.new(product_params)
@product.category_id = params[:category_id]
if @product.save
  redirect_to admin_products_path
else
  render :new
end
end
def edit
@product = Product.find(params[:id])
@categories = Category.all.map { |c| [c.name, c.id] } #这一行为加入的代码
end
def update
@product = Product.find(params[:id])
@product.category_id = params[:category_id]
if @product.update(product_params)
  redirect_to admin_products_path
else
  render :edit
end
end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :address, :image, :category_id)
  end
end
