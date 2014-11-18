class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token
  
  respond_to :json
  
  def create
    build_resource
    if resource.save
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
end