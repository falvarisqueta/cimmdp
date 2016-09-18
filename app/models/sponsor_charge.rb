class SponsorCharge < ActiveRecord::Base
  belongs_to :sponsor
  belongs_to :appointment

  validates :appointment_id, :sponsor_id, presence: true

  def reason
    "#{appointment.patient.full_name} (#{appointment.patient.patient_number}) completed #{appointment.visit.complete_name}"
  end

  def amount
    sponsor_fee = SponsorFee.where(
                        sponsor_id: sponsor_id,
                        visit_type_id: appointment.visit.visit_type_id).first

    if sponsor_fee.nil?
      appointment.visit.price
    else
      appointment.visit.price + appointment.visit.price * sponsor_fee.fee_percentage
    end
  end

  def invoice
    update_attributes!(payment_status_id: PaymentStatus::Invoiced.id)
  end
end
