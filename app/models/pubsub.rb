class Pubsub
  attr_reader :redis
  def initialize
    @redis = Redis.new
  end

  def pub(truck_id, lat, long)
    data = {:truck_id => truck_id, :latitude => lat, :longitude => long}
    redis.publish 'stream', data.to_json
  end
end