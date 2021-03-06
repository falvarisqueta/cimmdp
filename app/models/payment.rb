class Payment < ActiveRecord::Base
  include PaymentStatus

  belongs_to :doctor
  belongs_to :user
  belongs_to :appointment

  validates :appointment_id, presence: true

  scope :referring_doctor_payments, -> { where.not(doctor: nil) }
  scope :cimmdp_payments, -> { where(doctor: nil) }

  def receiver
    doctor.nil? ? user.full_name : "#{doctor.full_name} (referring doctor) "
  end

  def amount
    doctor.nil? ? appointment.visit.visit_type.price : appointment.visit.protocol.referring_doctor_payment_price
  end

  def self.pay(payments_ids)
    Payment.where('id IN (?)', payments_ids).update_all(payment_status_id: PaymentStatus::Payed.id)
  end

end
