class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
   flash[:notice] = "早安！你好！"
 end
end
