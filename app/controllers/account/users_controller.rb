class Account::UsersController < ApplicationController
  before_action :authenticate_user!


end
