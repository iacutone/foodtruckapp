class Api::V1::RegistrationsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    truck = Truck.new(params['truck'].permit(:email, :password, :name))
    if truck.save
      sign_in(truck)
      render(
              status: 200,
              json: {
                success: true,
                data: {
                  truck: truck,
                  auth_token: current_truck.token,
                  name: truck.name
                }
              }
            )
    else
      render(
              status: :unprocessable_entity,
              json: {
                success: false,
                info: truck.errors.full_messages,
                data: {}
              }
            )
    end
  end
end