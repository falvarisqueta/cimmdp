class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :identifier
      t.string :address
      t.string :phone
      t.string :phone_mobile
      t.string :contact_phone
      t.string :base_medication
      t.integer :referring_doctor_id
      t.integer :qualifying_pathology_id
      t.integer :protocol_id
      t.integer :target_protocol_id

      t.timestamps
    end
  end
end
