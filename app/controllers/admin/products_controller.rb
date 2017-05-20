class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout 'admin'

  def index
    @products = Product.all.order("position")
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @product.category_id = params[:category_id]     #这一行是实作类别选择时用
    @photo = @product.photos.build    #for multi-pics
  end

  def edit
    @product = Product.find(params[:id])
    # @categories = Category.all.map { |c| [c.name, c.id] }  #这一行是实作类别选择时用
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      # for multi-pics
      if params[:photos] != nil
        params[:photos]['avatar'].each do |a|
          @photo = @product.photos.create(:avatar => a)
        end
      end
      redirect_to admin_products_path, notice: "商品新建成功！"
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.category_id = params[:category_id]     #这一行是实作类别选择时用

    if params[:photos] != nil
      @product.photos.destroy_all #need to destroy old pics first

      params[:photos]['avatar'].each do |a|
        @photo = @product.photos.create(:avatar => a)
      end

      @product.update(product_params)
      redirect_to admin_products_path

    elsif @product.update(product_params)
      redirect_to admin_products_path, notice: "商品修改成功！"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to admin_products_path, alert: "商品已经删除！"
    end
  end

  def move_up
    @product = Product.find(params[:id])
    @product.move_higher
    redirect_to :back
  end

  def move_down
    @product = Product.find(params[:id])
    @product.move_lower
    redirect_to :back
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :image, :category_id, :group_ids => [])
  end
end
