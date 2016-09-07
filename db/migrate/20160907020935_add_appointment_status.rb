class AddAppointmentStatus < ActiveRecord::Migration
  def change
    add_column :appointments, :appointment_status_id, :integer
  end
end
