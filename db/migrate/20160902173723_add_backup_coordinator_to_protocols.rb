class AddBackupCoordinatorToProtocols < ActiveRecord::Migration
  def change
    add_column :protocols, :backup_coordinator_id, :integer
  end
end
