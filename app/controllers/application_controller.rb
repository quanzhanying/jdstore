class ApplicationController < ActionController::Base
  before_action :store_current_location, :unless => :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "You are not admin."
    end
  end

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if  params[:num].blank?
        num = 1
        #render :js => num.to_s
        if !current_cart.products.include?(@product)
          current_cart.add_product_to_cart(@product,num)
          #flash[:notice] = "你已成功将#{@product.title} 加入购物车"
        else
            #flash[:warning] = "你的购物车内已有此物品"
            ci = current_cart.cart_items.find_by(product_id: @product)
            if ci.quantity < @product.quantity
              ci.quantity += num
              ci.save
            else
              render :js => "alert('已经超过最大可购买数量');"
            end
        end
    else
      num = params[:num].to_i
      if  num <= @product.quantity
          if !current_cart.products.include?(@product)
              current_cart.add_product_to_cart(@product,num)
          else
              ci = current_cart.cart_items.find_by(product_id: @product)
              if ci.quantity < @product.quantity
                  if (ci.quantity + num) < @product.quantity
                    ci.quantity += num
                    ci.save
                  else
                    ci.quantity = @product.quantity
                    ci.save
                  end
              else
                  render :js => "alert('已经超过最大可购买数量');"
              end
          end
      end
      #redirect_to :back
    end
  end

  def favorite
    @product = Product.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorite_products << @product
      redirect_to :back

    elsif type == "unfavorite"
      current_user.favorite_products.delete(@product)
      redirect_to :back

    else
      redirect_to :back
    end
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

  def store_current_location
    if request.format == "text/html" || request.content_type == "text/html"
      store_location_for(:user, request.url)
    end
  end
  def after_sign_out_path_for(resource)
    request.referrer || root_path
  end
  protected

  	def configure_permitted_parameters
  		added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
  		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  		devise_parameter_sanitizer.permit :account_update, keys: added_attrs<<:current_password
  	end

end
