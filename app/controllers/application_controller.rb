class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def generate_token
     self.token = Digest::SHA1.hexdigest([self.id, Time.now, rand].join)
  end
  helper_method :generate_token
  
end
