class Protocol < ActiveRecord::Base

  has_many :patients
  belongs_to :sub_investigator, class_name: 'User'
  belongs_to :principal_investigator, class_name: 'User'
  belongs_to :coordinator, class_name: 'User'

  validates :name, :principal_investigator, :sub_investigator, :coordinator, presence: true

  validates :patients_commitment,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 1
            }
end
