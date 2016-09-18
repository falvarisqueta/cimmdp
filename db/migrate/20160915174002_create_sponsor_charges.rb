class CreateSponsorCharges < ActiveRecord::Migration
  def change
    create_table :sponsor_charges do |t|
      t.integer :sponsor_id
      t.integer :appointment_id
      t.integer :payment_status_id
      t.timestamps null: false
    end
  end
end
