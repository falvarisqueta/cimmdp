class CreatePatientDiseases < ActiveRecord::Migration
  def change
    create_table :patient_diseases do |t|
      t.integer :patient_id
      t.integer :disease_id
      t.timestamps null: false
    end
  end
end
