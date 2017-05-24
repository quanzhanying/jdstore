class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_pa​​rameters, if: :devise_controller?

  protected

  def configure_permitted_pa​​rameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:is_admin,:name])
  end
end
