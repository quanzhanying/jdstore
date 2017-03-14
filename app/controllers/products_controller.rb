class ProductsController < ApplicationController

  before_action :validate_search_key, only: [:search]
  before_action :authenticate_user!, only:[:upvote ,:collect,:discollect]

  def index
    @products= Product.all


    #@products=  case params[:order]
  #when 'by_price'
  #Product.all.order('price DESC')

#when 'by_quantity'
    #Product.all.order('quantity DESC')

  #when'by_created_at'
  #Product.all.order('created_at DESC')
#else
  #Product.all
#end

  end

def shop1
  @products1=Product.where(kind: "salad",owner:"shop1")
  @products2=Product.where(kind: "fruit",owner:"shop1")
  @products3=Product.where(kind: "set",owner:"shop1")
end

def shop2
  @products4=Product.where(kind: "salad",owner:"shop2")
  @products5=Product.where(kind: "fruit",owner:"shop2")
  @products6=Product.where(kind: "nut",owner:"shop2")
end

def shop3
  @products7=Product.where(kind: "fruit",owner:"shop3")
  @products8=Product.where(kind: "nut",owner:"shop3")
end

def search_fruit
  @products=Product.where(kind: "fruit")
end

def search_salad
  @products=Product.where(kind: "salad")
end

def search_nut
  @products=Product.where(kind: "nut")
end

  def menu0
    @products=Product.all
  end

def menu1
  @products=Product.all.order('price DESC')
end

def menu2
  @products=Product.all.order('quantity DESC')
end

def menu3
  @products=Product.all.order('created_at DESC')
end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product=Product.find(params[:id])
    if !current_cart.products.include?(@product)
    current_cart.add_product_to_cart(@product)
    flash[:notice]="你已经成功将#{@product.title}加入购物车"
  else
    flash[:warning]="你的购物车内已有此物品"
  end
    redirect_to :back

  end

  def upvote
    @product=Product.find(params[:id])
    @product.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @product=Product.find(params[:id])
    @product.downvote_by current_user
    redirect_to :back
  end

  def collect
    @product=Product.find(params[:id])
    if !current_user.has_collected?(@product)
      current_user.collect!(@product)
      flash[:notice]="You've successfully collected the item!"
    else
    flash[:warning] = "You've already collected the item!"
  end
    redirect_to product_path(@product)
    end


    def discollect
    @product = Product.find(params[:id])

    if current_user.has_collected?(@product)
      current_user.discollect!(@product)
      flash[:alert] = "You've successfully discollected the skill!"
    else
      flash[:warning] = "You haven't collected the skill yet!"
    end

    redirect_to product_path(@product)
  end

  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result
    end
  end



  protected

   def validate_search_key
     @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
     @search_criteria = search_criteria(@query_string)
   end


   def search_criteria(query_string)
     { :title_or_place_cont => query_string }
   end


end
