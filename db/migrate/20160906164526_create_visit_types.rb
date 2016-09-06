class CreateVisitTypes < ActiveRecord::Migration
  def change
    create_table :visit_types do |t|
      t.string :name
      t.float :price
      t.timestamps null: false
    end
  end
end
