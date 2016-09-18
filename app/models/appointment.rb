class Appointment < ActiveRecord::Base
  include AppointmentRoom
  include AppointmentStatus
  include VisitCategory
  include PaymentStatus

  belongs_to :doctor, class_name: 'User'
  belongs_to :patient
  belongs_to :visit

  accepts_nested_attributes_for :patient

  validates :patient_id, :start_time, presence: true
  validates :start_time, uniqueness: { scope: :doctor_id }
  validates :start_time, uniqueness: { scope: :place_id }

  delegate :full_name, to: :doctor, prefix: true

  def visits
    patient.visits
  end

  def place_name
    appointment_room.name
  end

  def completed?
    appointment_status_id == AppointmentStatus::Completed.id
  end

  def complete_appointment(appointment_params)
    unless completed? then
      register_doctor_payment
      register_referring_doctor_payment
      register_sponsor_charge
      update_attributes!(appointment_params.merge(appointment_status_id: AppointmentStatus::Completed.id))
    end
  end

  private

  def register_doctor_payment
    Payment.create(
      user_id: doctor_id,
      appointment_id: id,
      payment_status_id: PaymentStatus::Pending.id,
    )
  end

  def register_referring_doctor_payment
    Payment.create(
      doctor_id: patient.referring_doctor_id,
      appointment_id: id,
      payment_status_id: PaymentStatus::Pending.id,
    ) if visit.visit_type_id == VisitCategory::Rando.id
  end

  def register_sponsor_charge
    SponsorCharge.create(
      sponsor_id: visit.protocol.sponsor_id,
      appointment_id: id,
      payment_status_id: PaymentStatus::Pending.id,
    )
  end
end
