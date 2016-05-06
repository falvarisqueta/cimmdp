class PatientDisease < ActiveRecord::Base
    belongs_to :patient
    belongs_to :disease 
end
