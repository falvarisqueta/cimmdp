class AddPatientProtocolStartDate < ActiveRecord::Migration
  def change
    remove_column :protocols, :protocol_start_date
    add_column :patients, :protocol_start_date, :date
  end
end
