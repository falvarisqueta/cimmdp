class Sponsor < ActiveRecord::Base
  has_many :protocols, dependent: :restrict_with_error
  has_many :sponsor_charges, dependent: :restrict_with_error

  validates :name, presence: true
end
