
  class Users::RegistrationsController < Devise::RegistrationsController
before_filter :configure_permitted_parameters

protected

def configure_permitted_parameters
devise_parameter_sanitizer.permit(:sign_up, keys: [:is_admin])
end
end
