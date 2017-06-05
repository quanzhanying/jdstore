class Account::AddressesController < ApplicationController
  before_action :authenticate_user!
  def index
    @addresses = current_user.addresses.order("updated_at desc")
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
    @addresses = current_user.addresses.order("updated_at desc")
  end

  def create
    @address = Address.new(address_params)
    @address.user = current_user
    @address.save
    redirect_to account_addresses_path
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    @address.save
    redirect_to account_addresses_path
  end

  def new
    @address = Address.new
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
