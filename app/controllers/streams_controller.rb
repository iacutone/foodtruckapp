class StreamsController < ActionController::Base
  include ActionController::Live

  def locations
    response.headers['Content-Type'] = 'text/event-stream'
    uri = URI.parse(ENV["REDISTOGO_URL"])
    redis = Redis.new(:url => ENV['REDISTOGO_URL'])
    redis.subscribe('stream') do |on|
      on.message do |event, data|
        Rails.logger.debug data
        response.stream.write("data:#{ data }\n\n")
      end
    end
    ensure
      response.stream.close
  end
end