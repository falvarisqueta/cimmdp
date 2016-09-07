module VisitCategory
  extend ActiveSupport::Concern

  Screening = StaticValue.new(1, 'Screening')
  Rando = StaticValue.new(2, 'Rando')
  Phone = StaticValue.new(3, 'Phone')
  Presence = StaticValue.new(4, 'Presence')

  Collection = constants.map { |visit_category| const_get(visit_category) }
  All = Collection.map(&:id)

end
