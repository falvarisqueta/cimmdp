class VisitType < ActiveRecord::Base
  has_many :visits, dependent: :restrict_with_error
  
end
