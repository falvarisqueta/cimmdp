class Visit < ActiveRecord::Base
  belongs_to :protocol
  belongs_to :visit_type

  validates :name, :protocol_id, :visit_type_id, :activities, presence: true

  validates :duration,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 1
            }

  validates :price, :sponsor_fee,
            numericality: {
              greater_than_or_equal_to: 0,
              allow_blank: true
            }

  delegate :name, to: :protocol, prefix: true
  delegate :name, to: :visit_type, prefix: true, allow_nil:true

  def complete_name
    protocol_name +  " - " + name
  end
end
