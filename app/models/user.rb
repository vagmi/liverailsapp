class User < ActiveRecord::Base
  def self.from_omniauth(fb_params)
    info = fb_params[:info]
    puts info.inspect
    u = self.where(:fb_id=>fb_params[:uid]).first_or_initialize
    if(u.new_record?)
      u.fb_id=fb_params[:uid]
      u.name=info[:name]
      u.email=info[:email]
      u.provider_properties = info.slice(:nickname, :image, :location)
      u.save!
    end
    u
  end
end
