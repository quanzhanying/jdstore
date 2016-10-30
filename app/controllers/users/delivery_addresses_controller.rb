class Users::DeliveryAddressesController < ApplicationController

	before_action :authenticate_user!

	def index
		@delivery_addresses = current_user.delivery_addresses
	end

	def new
		@delivery_address = DeliveryAddress.new
	end

	def create
		@delivery_address = DeliveryAddress.new(delivery_address_params)
		@delivery_address.user_id = current_user.id
		@delivery_address.save
		redirect_to users_delivery_addresses_path, notice: "新增地址成功"
	end

	def edit
		@delivery_address = DeliveryAddress.find(params[:id])

	end

	def update
		@delivery_address = DeliveryAddress.find(params[:id])
		@delivery_address.update(delivery_address_params)
		redirect_to users_delivery_addresses_path

	end

	def destroy
		@delivery_address = DeliveryAddress.find(params[:id])
		@delivery_address.destroy
		redirect_to users_delivery_addresses_path, notice: "删除地址成功"
	end

	private

	def delivery_address_params
		params.require(:delivery_address).permit(:name, :address, :phone)
	end


end
