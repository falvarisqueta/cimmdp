class AddAdditionalMonitors < ActiveRecord::Migration
  def change
    add_column :protocols, :monitor_name1, :string
    add_column :protocols, :monitor_phone1, :string
    add_column :protocols, :monitor_mobile1, :string
    add_column :protocols, :monitor_email1, :string
    add_column :protocols, :monitor_name2, :string
    add_column :protocols, :monitor_phone2, :string
    add_column :protocols, :monitor_mobile2, :string
    add_column :protocols, :monitor_email2, :string
  end
end
