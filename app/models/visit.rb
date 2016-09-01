class Visit < ActiveRecord::Base
  belongs_to :protocol

  validates :name, :protocol_id, :activities, presence: true

  validates :duration,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 1
            }

  validates :price,
            numericality: {
              greater_than_or_equal_to: 0
            }
  delegate :name, to: :protocol, prefix: true

end
