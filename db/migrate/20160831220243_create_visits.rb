class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :name
      t.integer :protocol_id
      t.integer :duration
      t.text :activities
      t.integer :price
      t.timestamps null: false
    end
  end
end
