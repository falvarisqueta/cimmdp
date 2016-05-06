class Appointment < ActiveRecord::Base
  include Filterable
  include AppointmentRoom
  include VisitType

  belongs_to :doctor
  belongs_to :patient

  validates :patient_id, :appointment_date, :visit_type_id, presence: true

  validates :doctor_id,
    presence: true,
    uniqueness: {
      scope: :appointment_date,
      message: "doctor already has an appointment for that date time"
    }

  validates :place_id,
    presence: true,
    uniqueness: {
      scope: :appointment_date,
      message: "doctor already has an appointment for that date time"
    }

end
