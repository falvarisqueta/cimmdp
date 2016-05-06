module VisitType
  extend ActiveSupport::Concern

  Eval = StaticValue.new(1, 'Evaluación')
  Screening = StaticValue.new(2, 'Screening')
  Rando = StaticValue.new(3, 'Rando')
  Phone = StaticValue.new(4, 'Telefónica')
  Presence = StaticValue.new(5, 'Presencial')
  Guide = StaticValue.new(6, 'Guía')
  Lab = StaticValue.new(7, 'Lab')

  Collection = constants.map { |visit_type| const_get(visit_type) }
  All = Collection.map(&:id)

  def visit_type
    VisitType::Collection.detect { |type| type.id == visit_type_id }
  end
end
