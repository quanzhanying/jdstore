class Admin::UsertypesController < ApplicationController
    def index
        @usertypes = User.all
    end

    def set_admin
        @user = User.find(params[:id])
        @user.is_admin = true
        @user.save
        redirect_to :back
    end

    def set_user
        @user = User.find(params[:id])
        @user.is_admin = false
        @user.save
        redirect_to :back
    end
end
