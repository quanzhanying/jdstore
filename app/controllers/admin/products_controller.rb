class Admin::ProductsController < AdminController


before_action :find_product, only:[:move_up,:move_down,:edit, :update,:destroy]

def move_up

  @product.move_higher
  redirect_to :back
end

def move_down

  @product.move_lower
  redirect_to :back
end

  def index
    @products=Product.all.order('position ASC')
  end

  def new
    @product =Product.new

  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      redirect_to admin_products_path
    else
      render :new
    end
  end


  def edit

  end

  def update

    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy

    @product.destroy
    redirect_to admin_products_path
    flash[:alert]="Product deleted"
  end



    private
    def product_params
      params.require(:product).permit(:title, :description, :price, :quantity, :image,:place,:kind,:owner,:position)
    end

    def find_product
      @product=Product.find(params[:id])
    end
end
