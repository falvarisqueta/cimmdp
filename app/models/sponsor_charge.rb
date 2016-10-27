class SponsorCharge < ActiveRecord::Base
  include PaymentStatus

  belongs_to :sponsor
  belongs_to :appointment

  validates :appointment_id, :sponsor_id, presence: true

  def amount
    appointment.visit.price.to_f + appointment.visit.price.to_f * appointment.visit.sponsor_fee.to_f
  end

  def self.invoice(payment_status_ids)
    unless payment_status_ids.blank?
      SponsorCharge.where('id IN (?)', payment_status_ids).update_all(payment_status_id: PaymentStatus::Invoiced.id)
    end
  end
end
