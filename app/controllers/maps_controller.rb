class MapsController < ApplicationController
  include ActionController::Live

  respond_to :json
  #each truck on the client side will subscribe to that truck's channel via truck.id
  #each ios truck will push its location to a route, which will publish lat long to that truck's channel
  #figure out if Pubs stay in memory or if they are killed after subscribers read
  def index
    @maps = Map.all
    respond_with(@maps)
  end

  def locations_stream
    response.headers['Content-Type'] = 'text/event-stream'
      redis = Redis.new
      redis.subscribe('namespaced:stream') do |on|
        on.message do |event, data|
          response.stream.write("data:#{ data }\n\n")
        end
      end
      ensure
        response.stream.close
      end
    end
  end


  private
    def set_map
      @map = Map.find(params[:id])
    end

    def map_params
      params[:map]
    end
end
