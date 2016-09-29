class SponsorCharge < ActiveRecord::Base
  belongs_to :sponsor
  belongs_to :appointment

  validates :appointment_id, :sponsor_id, presence: true

  def amount
    appointment.visit.price + appointment.visit.price * appointment.visit.sponsor_fee
  end

  def invoice
    update_attributes!(payment_status_id: PaymentStatus::Invoiced.id)
  end
end
