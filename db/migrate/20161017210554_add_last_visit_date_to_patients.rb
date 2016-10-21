class AddLastVisitDateToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :last_visit_date, :date
  end
end
