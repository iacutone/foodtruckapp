class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  
  def sign_in(thing)
    cookies.permanent[:token] = thing.token
    if thing.class.to_s == "Truck"
      self.current_truck = thing
    else 
      self.current_user = thing
    end
  end

  def current_truck=(truck)
    @current_truck = truck
  end

  def current_truck
    @current_truck ||= Truck.find_by_token(cookies[:token])
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_token(cookies[:token])
  end
  
  def sign_out
    self.current_truck = nil
    self.current_user = nil
    cookies.delete(:token)
  end
end
