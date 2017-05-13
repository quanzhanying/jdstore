class WelcomeController < ApplicationController
  def index
    flash[:notice] = "加油，亲爱的伙伴们！"
  end
end
