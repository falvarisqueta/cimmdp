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
      update_attributes!(appointment_params.merge(appointment_status_id: AppointmentStatus::Completed.id))
      register_doctor_payment
      register_referring_doctor_payment
    end
  end

  private



  def register_doctor_payment
    Payment.create(
      patient_id: patient_id,
      visit_id: visit_id,
      user_id: doctor_id,
      payment_status_id: PaymentStatus::Pending.id,
    )
  end

  def register_referring_doctor_payment
    Payment.create(
      patient_id: patient_id,
      visit_id: visit_id,
      user_id: doctor_id,
      doctor_id: patient.referring_doctor_id,
      payment_status_id: PaymentStatus::Pending.id,
    ) if visit.visit_type_id == VisitCategory::Rando.id
  end
end
