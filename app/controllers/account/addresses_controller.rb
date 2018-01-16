class Account::AddressesController < ApplicationController
  before_action :authenticate_user!
  def index
    @addresses = current_user.addresses.order("updated_at desc")
    @address = Address.new
    @url = 3
  end
  def edit
    @url = 3
    @address = Address.find(params[:id])
    @addresses = current_user.addresses.order("updated_at desc")
    @address = Address.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @address = Address.new(address_params)
    @address.user = current_user
    @address.save
    if params[:type].blank?
      redirect_to account_addresses_path
    elsif params[:type] == "1"
      @addresses = current_user.addresses.order("updated_at desc")
      respond_to do |format|
        format.js
      end
    end
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    @address.save
    if params[:type].blank?
      redirect_to account_addresses_path
    elsif params[:type] == "1"
      @addresses = current_user.addresses.order("updated_at desc")
      respond_to do |format|
        format.js
      end
    end
  end

  def new
    @address = Address.new
    respond_to do |format|
    format.html
    format.js
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to account_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:province,:city,:district,:addr,:phone,:name,:addr_default)
  end
end
