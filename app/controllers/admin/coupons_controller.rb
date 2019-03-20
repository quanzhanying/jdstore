class Admin::CouponsController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @coupons = Coupon.all
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

  def new
    @coupon = Coupon.new
  end

  def edit
    @coupon = Coupon.find(params[:id])
  end

  def update
    @coupon = Coupon.find(params[:id])

    if @coupon.update(coupon_params)
      redirect_to admin_coupons_path
    else
      render :edit
    end
  end

  def create
    @coupon = Coupon.new(coupon_params)

    if @coupon.save
      redirect_to admin_coupons_path
    else
      render :new
    end
  end

  private

  def coupon_params
    params.require(:coupon).permit(:title, :price, :start_at, :expire_at, :is_online, :status)
  end
end