class Admin::PhonesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  layout "admin"


  def index
    @phones = Phone.all
  end

  def new
    @phone = Phone.new
  end

  def edit
    @phone = Phone.find(params[:id])
  end

  def update
    @phone = Phone.find(params[:id])

    if @phone.update(phone_params)
      redirect_to admin_phones_path
    else
      render :edit
    end
  end

  def create
    @phone = Phone.new(phone_params)

    if @phone.save
      redirect_to admin_phones_path
    else
      render :new
    end
  end


  def show
    @phone = Phone.find(params[:id])
  end

  private

  def phone_params
    params.require(:phone).permit(:title, :description, :quantity, :price, :image)
  end
end
