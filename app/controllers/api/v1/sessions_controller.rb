class Api::V1::SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    truck = Truck.find_by(email: params['session']['truck']['email'].downcase)
    if truck && truck.authenticate(params['session']['truck']['password'])
      sign_in(truck)
      render(
              status: 200,
              json: {
                success: true,
                data: {
                  truck: truck,
                  auth_token: current_truck.token
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