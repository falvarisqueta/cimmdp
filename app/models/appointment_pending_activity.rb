class AppointmentPendingActivity < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :pending_activity
end
