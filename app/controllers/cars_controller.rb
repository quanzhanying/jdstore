class CarsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user = User.find[params[:user_id]]
    @cars = @user.car.all
  end
end
