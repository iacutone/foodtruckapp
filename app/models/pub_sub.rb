class PubSub

  def pub(hsh)
    redis.publish 'stream', hsh.to_json
  end
  
  def redis
    @redis ||= (redis_url ? Redis.new(url: redis_url) : Redis.new)
  end
  
  def redis_url
    ENV['REDISCLOUD_URL'] || nil
  end
end