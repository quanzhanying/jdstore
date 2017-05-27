class WelcomeController < ApplicationController
  layout "welcome"
  after_action :intercom_shutdown, only: [:index]

  def index
    @products = Product.all.sort_by{|product| -product.fans.count}
    @products = @products.first(8)
    @product1 = @products[0]
    @product2 = @products[1]
    @product3 = @products[2]
    @product4 = @products[3]
    @product5 = @products[4]
    @product6 = @products[5]
    @product7= @products[6]
    @product8 = @products[7]
    @p1 = @products[0]
    @p2 = @products[1]
    @p3 = @products[2]
    @p4 = @products[3]
    @p5 = @products[4]
    @p6 = @products[5]
    @p7 = @products[6]
    @p8 = @products[7]
  end

  def about
  end

  protected
  def intercom_shutdown
    IntercomRails::ShutdownHelper.intercom_shutdown(session, cookies)
  end
end
