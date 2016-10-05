class DropAppointmentPendingActivities < ActiveRecord::Migration
  def change
    drop_table :appointment_pending_activities
  end
end
