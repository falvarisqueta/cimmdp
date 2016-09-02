class User < ActiveRecord::Base
  serialize :role_ids

  def full_name
    first_name + "," + last_name
  end

end
