class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :patient_id
      t.datetime :appointment_date
      t.integer :place_id
      t.integer :visit_type_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end
