class Disease < ActiveRecord::Base
  has_many :patient_disease, dependent: :restrict_with_error
  has_many :patients, through: :patient_disease, dependent: :restrict_with_error

  validates :name, presence: true
end
