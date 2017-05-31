class OmniauthCallbacksController < ApplicationController

  def google_oauth2
		@user = User.from_google(request.env["omniauth.auth"], current_user)

		if @user.persisted?
			flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
			sign_in_and_redirect @user, :event => :authentication
		else
			session["devise.user_data"] = request.env["omniauth.auth"]
			redirect_to new_user_registration_path
		end
	end
  
end
