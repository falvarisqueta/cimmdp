class MoveMonitorInfoToProtocol < ActiveRecord::Migration
  def change
    remove_column :sponsors, :monitor
    remove_column :sponsors, :phone
    remove_column :sponsors, :phone_mobile
    remove_column :sponsors, :email
    add_column :protocols, :monitor_name, :string
    add_column :protocols, :monitor_phone, :string
    add_column :protocols, :monitor_mobile, :string
    add_column :protocols, :monitor_email, :string
    
  end
end
