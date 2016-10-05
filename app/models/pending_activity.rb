class PendingActivity < ActiveRecord::Base
  has_many :appointment_pending_activities
end
