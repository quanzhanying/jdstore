class Admin::ChefsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  layout "admin"

  def index
    @chefs = Chef.all
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.create(chef_parames)

    if @chef.save
      redirect_to admin_chefs_path, notice: "Chef Created."
    else
      render :new
    end
  end

  def edit
    @chef = Chef.find(param[:id])
  end

  def udpate
    @chef = Chef.find(param[:id])
    if @chef.update(chef_params)
      redirect_to admin_chefs_path, notice: "Chef Updated."
    else
      render :edit
    end
  end

  def show
    @chef = Chef.find(param[:id])
  end

  def publish
    @chef = Chef.find(params[:id])
    @chef.publish!
    redirect_to :back
  end

  def hidden
    @chef = Chef.find(params[:id])
    @chef.hide!
    redirect_to :back
  end

  private
  def chef_parames
    params.request(:chef).permit(:name, :description, :level, :style, :image, :is_hidden)
  end

end
