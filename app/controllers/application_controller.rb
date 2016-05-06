class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  layout( :choose_layout, except: :root )

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    user_path(user)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:type])
  end

  def choose_layout
    if user_signed_in?
      current_user.type.downcase
    end
  end
end
