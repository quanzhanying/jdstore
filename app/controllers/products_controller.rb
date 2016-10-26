class ProductController < ApplicationController
  before_action :authenticate_user! 

end
