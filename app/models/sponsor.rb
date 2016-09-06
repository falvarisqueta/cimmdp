class Sponsor < ActiveRecord::Base
  has_many :protocols
  
  validates :name, presence: true
end
