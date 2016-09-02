class AddAppointmentEnddate < ActiveRecord::Migration
  def change
    add_column :appointments, :end_time, :datetime
    rename_column :appointments, :appointment_date, :start_time
  end
end
