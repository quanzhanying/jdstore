class Admin::ProductsController < ApplicationController

 layout "admin"
 before_action :authenticate_user!
 before_action :admin_required
 before_action :find_product, only: [:show, :edit, :update, :destroy]

def index
  @products = Product.all
end



def new
  @product = Product.new
  @categories = Category.all.map { |c| [c.name, c.id] } #这一行为加入的代码

# 新建商品图片
  @product_image = @product.product_images.build

end


def create
  @product = Product.new(product_params)
  @product.category_id = params[:category_id]

  if @product.save
    # 保存新建商品图片
    if params[:product_images] != nil
       params[:product_images]['image'].each do |a|
         @product_image = @product.product_images.create(:image => a)
       end
    end
    redirect_to admin_products_path
  else
    render :new
  end
end

def edit
  @product = Product.find(params[:id])
  @categories = Category.all.map{ |c| [c.name, c.id]}
end

def destroy

    @product.destroy
    redirect_to admin_products_path
  end

def update
  @product = Product.find(params[:id])
  @product.category_id = params[:category_id]

  if params[:product_images] != nil
    @product.product_images.destroy_all #need to destroy old pics first

    params[:product_images]['image'].each do |a|
    @product.product_images.create(:image => a)
    end

    @product.update(product_params)
    redirect_to admin_products_path

  elsif @product.update(product_params)
    redirect_to admin_products_path
  else
    render :edit
  end
end

private

def find_product
     @product = Product.find(params[:id])
  end

def product_params
  params.require(:product).permit(:title, :description, :quantity, :price, :image, :category_id)
end
end
