class StreamsController < ActionController::Base
  include ActionController::Live

  def locations
    response.headers['Content-Type'] = 'text/event-stream'
    redis.subscribe('stream') do |on|
      on.message do |event, data|
        Rails.logger.debug data
        response.stream.write("data:#{ data }\n\n")
      end
    end
    ensure
      response.stream.close
  end
  
  def redis
    @redis ||= (redis_url ? Redis.new(url: redis_url) : Redis.new)
  end
  
  def redis_url
    ENV['REDISCLOUD_URL'] || nil
  end
end