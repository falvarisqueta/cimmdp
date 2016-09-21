class RemoveProtocolSubInvestigator < ActiveRecord::Migration
  def change
    remove_column :protocols, :sub_investigator_id
  end
end
