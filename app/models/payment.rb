class Payment < ActiveRecord::Base
  belongs_to :visit
  belongs_to :doctor
  belongs_to :patient

  validates :patient_id, :doctor_id, :visit_id, presence: true
end
