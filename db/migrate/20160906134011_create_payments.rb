class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :doctor_id
      t.integer :patient_id
      t.integer :visit_id
      t.timestamps null: false
    end
  end
end
