class CreateAppointmentPendingActivities < ActiveRecord::Migration
  def change
    create_table :appointment_pending_activities do |t|
      t.integer :appointment_id
      t.integer :pending_activity_id
    end
  end
end
