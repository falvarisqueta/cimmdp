class Payment < ActiveRecord::Base
  belongs_to :visit
  belongs_to :doctor
  belongs_to :patient
  belongs_to :user

  validates :patient_id, :user_id, :visit_id, presence: true

  def receiver
    doctor.nil? ? user : doctor
  end

  def reason
    patient.full_name + " completed " + visit.complete_name
  end

  def amount
    50
  end

end
