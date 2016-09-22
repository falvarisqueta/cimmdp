class AddRefererPaymentPrice < ActiveRecord::Migration
  def change
    add_column :protocols, :referring_doctor_payment_price, :float
  end
end
