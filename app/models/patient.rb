class Patient < ActiveRecord::Base

 belongs_to :protocol
 belongs_to :target_protocol, class_name: 'Protocol'
 belongs_to :referring_doctor, class_name: 'Doctor'
 belongs_to :qualifying_disease, class_name: 'Disease'
 has_many :clinic_histories
 has_many :patient_disease
 has_many :diseases, through: :patient_disease

 validates :first_name, :last_name, :identifier, :address,:phone, :phone_mobile,
    :contact_phone, :referring_doctor_id, :qualifying_pathology_id, :target_protocol_id,
    :contact_name, :contact_relationship,
    presence: true

 validates :identifier, uniqueness: true

 scope :search, -> (criteria) { where name: criteria }

 delegate :name, to: :protocol, prefix: true, allow_nil: true

 def full_name
   first_name + ', ' + last_name
 end

 def visits
   protocol.blank? ? target_protocol.visits : protocol.visits
 end

end
