class StreamsController < ActionController::Base
  include ActionController::Live

  def locations
    response.headers['Content-Type'] = 'text/event-stream'
    redis = Redis.new
    redis.subscribe('stream') do |on|
      on.message do |event, data|
        puts data
        response.stream.write("data:#{ data }\n\n")
      end
    end
    ensure
      response.stream.close
  end
end