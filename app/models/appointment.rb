class Appointment < ActiveRecord::Base
  include AppointmentRoom

  belongs_to :doctor, class_name: 'User'
  belongs_to :patient
  belongs_to :visit

  validates :patient_id, :start_time, presence: true

  delegate :full_name, to: :doctor, prefix: true

  def visits
    patient.visits
  end

  def place_name
    appointment_room.name
  end

end
