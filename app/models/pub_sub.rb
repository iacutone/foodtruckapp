class PubSub
  attr_reader :redis
  def initialize
    uri = URI.parse(ENV["REDISTOGO_URL"])
    @redis = Redis.new(:url => ENV['REDISTOGO_URL'])
  end

  def pub(hsh)
    redis.publish 'stream', hsh.to_json
  end
end