class AddPatientLastVisit < ActiveRecord::Migration
  def change
    add_column :patients, :last_visit_id, :integer
  end
end
