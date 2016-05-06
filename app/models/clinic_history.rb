class ClinicHistory < ActiveRecord::Base
  belongs_to :patient
end
