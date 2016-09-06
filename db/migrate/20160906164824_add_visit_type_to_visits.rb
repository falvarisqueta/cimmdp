class AddVisitTypeToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :visit_type_id, :integer
  end
end
