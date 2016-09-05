class AddPatientClinicalHistory < ActiveRecord::Migration
  def change
    add_column :patients, :clinical_history, :text
  end
end
