class ChefsController < ApplicationController
  before_action :authenticate_user!, only: [:add_to_cart]

  def index
    @chefs = case params[:order]
            when 'by_followers'
              Chef.published.sort_by{|chef| chef.followers.count}.reverse
            when 'by_level'
              Chef.published.order("chef_level_id")
            else
              Chef.published.recent
            end
    if params[:city].present?
      @chefs = @chefs.where(city: params[:city])
    end
  end

  def show
    @chef = Chef.find(params[:id])
    @photos = @chef.photos.all
    if current_cart.chef_id != nil
      current_chef_in_cart = Chef.find(current_cart.chef_id)
      if @chef.style != current_chef_in_cart.style
        flash[:warning] = "您当前选择的厨师 #{current_chef_in_cart.name} 的菜系是#{current_chef_in_cart.style}， 如果更换其他菜系厨师需要重新选择菜品！"
      end
    end
    @chef_comments = ChefComment.where(chef_id: @chef.id).order("created_at DESC")
    @chef_comment = ChefComment.new
  end

  def add_to_cart
    if current_cart.book_date == nil
      flash[:warning] = "请先选择预定日期！"
      redirect_to :back
    else
        @chef = Chef.find(params[:id])
        if current_cart.chef_id != nil
          current_chef_in_cart = Chef.find(current_cart.chef_id)
          if @chef.style != current_chef_in_cart.style
            flash[:warning] = "当前购物车已清空！请重新选择菜品！"
            current_cart.clean!
          end
        end
        current_cart.chef_id = @chef.id
        current_cart.save
        redirect_to products_path
    end
  end

  def follow
    @chef = Chef.find(params[:id])
    current_user.follow!(@chef)

    redirect_to :back
  end

  def unfollow
    @chef = Chef.find(params[:id])
    current_user.unfollow!(@chef)

    #flash[:warning] = "Stop follow!"
    redirect_to :back
  end
end
