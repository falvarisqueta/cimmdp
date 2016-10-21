class AddVisitDaysLimits < ActiveRecord::Migration
  def change
    rename_column :visits, :window, :window_lower
    add_column :visits, :window_upper, :integer
    add_column :visits, :days_from_start, :integer
  end
end
