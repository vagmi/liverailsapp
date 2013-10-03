require 'redis_utils'
class SubscriptionsController < ApplicationController
  include ActionController::Live
  def subscribe
    begin
      channel_name = params[:channel_name]
      response.headers['Content-Type']='text/event-stream'
      redis = RedisUtils.instance.redis_client
      redis.subscribe channel_name do |on|
        on.message do |channel,message|
          response.stream.write("data: " + message + "\n\n")
        end
      end
    rescue IOError
      puts "rescued from io error"
    ensure
      response.stream.close
    end
  end
end
