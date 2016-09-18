class SponsorFee < ActiveRecord::Base
  belongs_to :sponsor
  belongs_to :visit_type

  validates :visit_type_id, :sponsor_id, presence: true
  validates :visit_type_id, uniqueness: { scope: :sponsor_id }

  validates :fee_percentage,
            numericality: {
              greater_than_or_equal_to: 0
            }

end
