class AddUserRole < ActiveRecord::Migration
  def change
    add_column :users, :role_ids, :integer, array: true
  end
end
