class AddPaymentStatus < ActiveRecord::Migration
  def change
    add_column :payments, :payment_status_id, :integer
  end
end
