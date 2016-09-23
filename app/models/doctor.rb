class Doctor < ActiveRecord::Base
  has_many :patients, foreign_key: 'referring_doctor_id', dependent: :restrict_with_error
  has_many :payments, dependent: :restrict_with_error
  
  validates :first_name, :last_name, presence: true

  def full_name
    first_name + ", " + last_name
  end

end
