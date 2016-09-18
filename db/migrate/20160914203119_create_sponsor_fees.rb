class CreateSponsorFees < ActiveRecord::Migration
  def change
    create_table :sponsor_fees do |t|
      t.integer :sponsor_id
      t.integer :visit_type_id
      t.float :fee_percentage
      t.timestamps null: false
    end
  end
end
