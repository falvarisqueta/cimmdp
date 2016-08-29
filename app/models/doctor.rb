class Doctor < ActiveRecord::Base
  include Filterable

  validates :first_name, :last_name, presence: true

  def full_name
    first_name + ", " + last_name
  end

end
