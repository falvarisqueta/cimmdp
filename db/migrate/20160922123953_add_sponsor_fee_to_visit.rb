class AddSponsorFeeToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :sponsor_fee, :float
  end
end
