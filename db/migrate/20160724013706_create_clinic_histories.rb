class CreateClinicHistories < ActiveRecord::Migration
  def change
    create_table :clinic_histories do |t|
      t.string :entry
      t.integer :patient_id
      t.timestamps null: false
    end
  end
end
