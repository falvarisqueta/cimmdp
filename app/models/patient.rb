class Patient < ActiveRecord::Base
 attr_accessor :clinical_history_entry

 belongs_to :protocol
 belongs_to :target_protocol, class_name: 'Protocol'
 belongs_to :referring_doctor, class_name: 'Doctor'
 belongs_to :qualifying_disease, class_name: 'Disease'
 belongs_to :last_visit, class_name: 'Visit'
 has_many :patient_disease, dependent: :destroy
 has_many :diseases, through: :patient_disease, dependent: :restrict_with_error
 has_many :appointments, dependent: :restrict_with_error

 validates :first_name, :last_name, :identifier, :address,:phone, :phone_mobile,
    :contact_phone, :referring_doctor_id, :target_protocol_id,
    :contact_name, :contact_relationship,
    presence: true

 validates :identifier, uniqueness: true
 validates :patient_number, uniqueness: {scope: :protocol_id}

 scope :search, -> (criteria) { where name: criteria }

 delegate :name, to: :protocol, prefix: true, allow_nil: true

 def full_name
   first_name + ', ' + last_name
 end

 def visits
   protocol.blank? ? target_protocol.visits : protocol.visits
 end

 def complete_appointment(clinical_history_entry, visit_id, appointment_status_id)
   update_attributes(
    last_visit_id: appointment_visit_id(visit_id, appointment_status_id),
    last_visit_date: Date.today,
    clinical_history: appointment_clinical_history(clinical_history_entry))
 end

 def next_visit
   unless protocol.blank?
     visit_order = last_visit ? last_visit.order + 1 : 1
     Visit.where(protocol_id: protocol.id, order: visit_order).first
   end
 end

 def next_visit_date
   unless protocol.blank?
     base_date = protocol_start_date + next_visit.days_from_start.to_i.days
     from_date = base_date - next_visit.window_lower.to_i.days
     to_date = base_date + next_visit.window_upper.to_i.days
     from_date..to_date
   end
 end

 private

 def appointment_clinical_history(clinical_history_entry)
   clinical_history_entry.empty? ? new_clinical_history(clinical_history_entry) : clinical_history
 end

 def appointment_visit_id(visit_id, appointment_status_id)
   #Could have many visits in progress. Considered last visit if Status before complete is pendig.
   appointment_status_id == AppointmentStatus::Pending.id ? visit_id : last_visit_id
 end

 def new_clinical_history(clinical_history_entry)
   "[#{Date.today}] \r\n #{clinical_history_entry} \r\n\r\n #{clinical_history}"
 end

end
