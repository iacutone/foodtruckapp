class MapsController < ApplicationController
  #include ActionController::Live
  respond_to :json
  #each truck on the client side will subscribe to that truck's channel via truck.id
  #each ios truck will push its location to a route, which will publish lat long to that truck's channel
  #figure out if Pubs stay in memory or if they are killed after subscribers read
  def index

  end

  def location
    Pubsub.new().pub(params[:truck_id], params[:latitude], params[:longitude])
    head :no_content
  end

  private
  def set_map
    @map = Map.find(params[:id])
  end

  def map_params
    params[:map]
  end
end
