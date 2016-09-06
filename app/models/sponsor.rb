class Sponsor < ActiveRecord::Base
  has_many :protocols

  validates :name, :monitor, :phone, :phone_mobile, :email, presence: true
end
