class AddPatientProtocolStartDay < ActiveRecord::Migration
  def change
    add_column :protocols, :protocol_start_date, :date
  end
end
