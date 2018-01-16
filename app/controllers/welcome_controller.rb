class WelcomeController < ApplicationController
  def index
    flash[:notice] = "买东西啦～～～"
  end
end
