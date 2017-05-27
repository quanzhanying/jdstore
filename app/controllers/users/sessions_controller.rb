class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
   after_action :prepare_intercom_shutdown, only: [:destroy]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end



  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected
  def prepare_intercom_shutdown
     IntercomRails::ShutdownHelper.prepare_intercom_shutdown(session)
  end

end
