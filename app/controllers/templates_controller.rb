class TemplatesController < ApplicationController

  def index
    @templates = Template.all
  end

  def show
    @template = Template.find(params[:id])
  end

  def add_to_cart
    @template = Template.find(params[:id])
    if !current_cart.templates.include?(@template)
      current_cart.add_template_to_cart(@template)
      flash[:notice] = "你已成功将 #{@template.title} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end
    redirect_to :back
  end

end
