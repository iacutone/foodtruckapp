class Pubsub
  attr_reader :redis
  def initialize
    @redis = Redis.new
  end

  def pub(hsh)
    redis.publish 'stream', hsh.to_json
  end
end