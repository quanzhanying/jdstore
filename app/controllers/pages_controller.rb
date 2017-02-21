class PagesController < ApplicationController
  def demo
    render template: "pages/#{params[:page]}"
  end
end
