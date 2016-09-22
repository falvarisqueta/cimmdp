class DropSponsorFees < ActiveRecord::Migration
  def change
    drop_table :sponsor_fees
  end
end
