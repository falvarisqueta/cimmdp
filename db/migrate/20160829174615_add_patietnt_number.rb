class AddPatietntNumber < ActiveRecord::Migration
  def change
    add_column :patients, :patient_number, :string
  end
end
