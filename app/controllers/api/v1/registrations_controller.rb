class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token
  before_action :configure_permitted_parameters
  
  def create
    puts params
    @truck = Truck.new(params[:truck])
    # @truck.skip_confirmation!
    puts @truck
    
    t = Truck.new(sign_up_params)
    puts '<<<<<<<'
    puts t
    if @truck.save
      sign_in(resource, :store => false)
      render :status => 200,
           :json => { :success => true,
                      :info => t("devise.registrations.signed_up"),
                      :data => { :truck => resource,
                                 :auth_token => current_truck.authentication_token } }
    else
      render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => resource.errors.full_messages,
                        :data => {} }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation)
    end
  end
end