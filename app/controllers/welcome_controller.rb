class WelcomeController < ApplicationController
  def index
    flash[:notice] = "hello,morning!"
  end
end
