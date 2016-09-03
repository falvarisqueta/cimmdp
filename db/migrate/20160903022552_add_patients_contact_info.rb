class AddPatientsContactInfo < ActiveRecord::Migration
  def change
    add_column :patients, :contact_name, :string
    add_column :patients, :contact_relationship, :string
  end
end
