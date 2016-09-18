class RemovePaymentColumns < ActiveRecord::Migration
  def change
    remove_column :payments, :patient_id
    remove_column :payments, :visit_id
  end
end
