class Patient < ActiveRecord::Base
 attr_accessor :clinical_history_entry

 belongs_to :protocol
 belongs_to :target_protocol, class_name: 'Protocol'
 belongs_to :referring_doctor, class_name: 'Doctor'
 belongs_to :qualifying_disease, class_name: 'Disease'
 has_many :patient_disease, dependent: :destroy
 has_many :diseases, through: :patient_disease, dependent: :restrict_with_error
 has_many :appointments, dependent: :restrict_with_error

 validates :first_name, :last_name, :identifier, :address,:phone, :phone_mobile,
    :contact_phone, :referring_doctor_id, :target_protocol_id,
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

 def append_clinical_history(clinical_history_entry)
   unless clinical_history_entry.empty?
     new_clinical_history = "[#{Date.today}] \r\n #{clinical_history_entry} \r\n\r\n #{clinical_history}"
     update_attributes!(clinical_history: new_clinical_history)
   end
 end

end
