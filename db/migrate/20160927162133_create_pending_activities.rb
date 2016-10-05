class CreatePendingActivities < ActiveRecord::Migration
  def change
    create_table :pending_activities do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
