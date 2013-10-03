require 'singleton'
class RedisUtils
  include Singleton
  def redis_client
    Redis.new(:timeout=>0)
  end
end
