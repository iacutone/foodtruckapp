class Api::V1::RegistrationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def create
    @truck = Truck.create!(params[:truck])
    # build_resource
    # resource.skip_confirmation!
    # @truck = Truck.create(json stuff)
    # if resource.save
    #   sign_in(resource, :store => false)
      render :status => 200,
           :json => { :success => true,
                      :info => t("devise.registrations.signed_up"),
                      :data => { :truck => resource,
                                 :auth_token => @truck.token } }
    # else
    #   render :status => :unprocessable_entity,
    #          :json => { :success => false,
    #                     :info => resource.errors.full_messages,
    #                     :data => {} }
    # end
  end
end