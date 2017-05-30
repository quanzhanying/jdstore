class Users::SessionsController < Devise::SessionsController
  prepend_before_action :valify_captcha!, only: [:create]

  def valify_captcha!
    unless verify_rucaptcha?
      redirect_to new_user_session_path, alert: t('rucaptcha.invalid')
      return
    end
    true
  end
end
