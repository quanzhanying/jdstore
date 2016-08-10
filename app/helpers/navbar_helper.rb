module NavbarHelper
  


  def render_login_logout_part

  	if !current_user
  		render "common/navbeforelogin"
  	elsif current_user.admin? || current_user.email == "abc@abc.com"
  		render "common/navAfterLoginAsAdmin"	
  	else
  		render "common/navAfterLoginAsCustomer"
	end

  end

end