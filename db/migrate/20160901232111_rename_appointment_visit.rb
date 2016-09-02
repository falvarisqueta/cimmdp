class RenameAppointmentVisit < ActiveRecord::Migration
  def change
    rename_column :appointments, :visit_type_id, :visit_id
  end
end
