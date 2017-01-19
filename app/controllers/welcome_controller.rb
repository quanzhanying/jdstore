class WelcomeController < ApplicationController
  def index
    flash[:notice]="hehe"
  end
end
