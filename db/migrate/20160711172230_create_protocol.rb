class CreateProtocol < ActiveRecord::Migration
  def change
    create_table :protocols do |t|
      t.string :name
      t.integer :patients_commitment
      t.integer :principal_investigator_id
      t.integer :sub_investigator_id
      t.integer :coordinator_id

      t.timestamps
    end
  end
end
