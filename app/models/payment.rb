class Payment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :user
  belongs_to :appointment

  validates :appointment_id, presence: true

  def receiver
    doctor.nil? ? user.full_name : "#{doctor.full_name} (referring doctor) "
  end

  def reason
    "#{appointment.patient.full_name} (#{appointment.patient.patient_number}) completed #{appointment.visit.complete_name}"
  end

  def amount
    doctor.nil? ? appointment.visit.visit_type.price : appointment.visit.protocol.referring_doctor_payment_price
  end

  def pay
    update_attributes!(payment_status_id: PaymentStatus::Payed.id)
  end

end
