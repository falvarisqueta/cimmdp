class AddAppointentIdToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :appointment_id, :integer
  end
end
