class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
  end
  
  def sign_in(truck)
    cookies.permanent[:token] = truck.token
    self.current_truck = truck
  end

  def current_truck=(truck)
    @current_truck = truck
  end

  def current_truck
    @current_truck ||= Truck.find_by_token(cookies[:token])
  end
  
  def sign_out
    self.current_truck = nil
    cookies.delete(:token)
  end
end
