class User < ActiveRecord::Base

  def full_name
    first_name + "," + last_name
  end

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.first_name = auth.info.name
      user.email = auth.info.email
      user.save!
    end if auth.info.email.split("@")[1] == "cimmdp.com"
  end
end
