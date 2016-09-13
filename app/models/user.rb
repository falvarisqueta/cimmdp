class User < ActiveRecord::Base

  has_many :user_permissions

  def full_name
    last_name.nil? ? first_name : first_name + "," + last_name
  end

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.first_name = auth.info.name
      user.email = auth.info.email
      user.save!
    end if auth.info.email.split("@")[1] == "cimmdp.com"
  end

  def finance_person?
    user_permissions.exists?(Permission::Finance.id) || user_permissions.exists?(Permission::Admin.id)
  end
  
end
