class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  #客服相关开始
    after_action :prepare_intercom_shutdown, only: [:destroy]
    protected
    def prepare_intercom_shutdown
      IntercomRails::ShutdownHelper.prepare_intercom_shutdown(session)
    end
  #客服相关结束
end
