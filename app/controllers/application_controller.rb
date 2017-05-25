class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :validate_search_key, only: [:search]

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert:"you are not admin"
    end
  end

  helper_method :current_cart
  def current_cart
    @current_cart ||= find_cart
  end

  def search
      if @query_string.present?
        search_result = Product.ransack(@search_criteria).result(:distinct => true)
        @products = search_result.paginate(:page => params[:page], :per_page => 5 )
      end
    end


    protected

    def validate_search_key
      @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
      @search_criteria = search_criteria(@query_string)
    end


    def search_criteria(query_string)
      { :title_cont => query_string }
    end
  private

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    return cart
  end
end
