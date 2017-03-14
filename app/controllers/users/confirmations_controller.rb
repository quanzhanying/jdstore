class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
<<<<<<< HEAD

  prepend_before_action :valify_captcha!, only: [:create]

  def valify_captcha!
    unless verify_rucaptcha?
      redirect_to new_user_session_path, alert: t('rucaptcha.invalid')
      return
    end
    true
  end
  
=======
>>>>>>> b33bbc78e37bf4157886e848a62036337910b3dc
end
