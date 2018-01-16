class WelcomeController < ApplicationController
  def index
    flash[:notice]="早安,中国"
  end
end
