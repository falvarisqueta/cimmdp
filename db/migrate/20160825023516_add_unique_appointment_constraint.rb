class AddUniqueAppointmentConstraint < ActiveRecord::Migration
  def change
    add_index :appointments, [:doctor_id, :place_id, :appointment_date], unique: true, name: 'appointment_unique'
    add_index :appointments, [:doctor_id, :appointment_date], unique: true, name: 'doctor_appointment_unique'
    add_index :appointments, [:place_id, :appointment_date], unique: true, name: 'place_appointment_unique'
  end
end
