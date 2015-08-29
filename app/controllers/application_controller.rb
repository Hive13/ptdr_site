class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_params, if: :devise_controller?
  protect_from_forgery with: :exception


  protected

  def configure_permitted_params
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :current_password) }
  end


end
