class AddVisitWindowAndOrder < ActiveRecord::Migration
  def change
    add_column :visits, :order, :integer
    add_column :visits, :window, :integer
  end
end
