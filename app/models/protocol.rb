class Protocol < ActiveRecord::Base

  has_many :patients
  has_many :visits
  belongs_to :principal_investigator, class_name: 'User'
  belongs_to :coordinator, class_name: 'User'
  belongs_to :backup_coordinator, class_name: 'User'
  belongs_to :sponsor
  has_many :protocol_sub_investigator
  has_many :sub_investigators, through: :protocol_sub_investigator, source: :user

  validates :name,
    :code,
    :principal_investigator_id,
    :coordinator_id,
    :backup_coordinator_id,
  presence: true

  validates :referring_doctor_payment_price,
            numericality: {
              greater_than_or_equal_to: 0,
              allow_blank: true
            }

  validates :patients_commitment,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 1
            }

  delegate :full_name, to: :principal_investigator, prefix: true, allow_nil: true
  delegate :full_name, to: :coordinator, prefix: true, allow_nil: true
  delegate :full_name, to: :backup_coordinator, prefix: true, allow_nil: true
  delegate :name, to: :sponsor, prefix: true, allow_nil: true
end
