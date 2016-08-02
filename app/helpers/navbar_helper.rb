module NavbarHelper
  


  def render_login_logout_part

  	if !current_user && !current_seller
  		render "common/beforelogin"
  	elsif current_seller.nil?
  		render "common/afterLoginAsCustomer"	
  	else
  		render "common/afterLoginAsSeller"
	end

  end

end