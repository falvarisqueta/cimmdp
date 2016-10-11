class DropAppointmentPendingActivities < ActiveRecord::Migration
  def change
    drop_table :appointment_pending_activities, if_exists: true
  end
end
