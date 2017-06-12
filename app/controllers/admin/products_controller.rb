class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @products = Product.order("position ASC")
    @products = @products.paginate(:page => params[:page], :per_page => 8)
  end

  def new
    @product = Product.new
    @categories = Category.all.map { |c| [c.name, c.id] }
    @photo = @product.photos.build   #for multi-pics
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      if params[:photos] != nil
           params[:photos]['avatar'].each do |a|
             @photo = @product.photos.create(:avatar => a)
           end
      end

      @product.category_id = params[:category_id]
      redirect_to admin_categories_path
    else
      render :new
    end
  end


  def edit
    @product = Product.find_by_friendly_id!(params[:id])
  end

  def update
    @product = Product.find_by_friendly_id!(params[:id])
    @product.category_id = params[:category_id]

    if params[:photos] != nil
      @product.photos.destroy_all #need to destroy old pics first

      params[:photos]['avatar'].each do |a|
        @picture = @product.photos.create(:avatar => a)
      end

      @product.update(product_params)
      redirect_to admin_categories_path, notice: "Update Successful"

    elsif @product.update(product_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find_by_friendly_id!(params[:id])

    if @product.destroy
      redirect_to admin_categories_path, alert: "Product Deleted"
    end
  end

  def move_up
    @product = Product.find_by_friendly_id!(params[:id])
    @product.move_higher
    redirect_to :back
  end

  def move_down
    @product = Product.find_by_friendly_id!(params[:id])
    @product.move_lower
    redirect_to :back
  end



    private

    def product_params
      params.require(:product).permit(:title, :description, :quantity, :price, :image, :category_id)
    end

end
