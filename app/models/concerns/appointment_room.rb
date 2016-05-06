module AppointmentRoom
  extend ActiveSupport::Concern

  Consulting = StaticValue.new(1, 'Consultorio')
  Analysis = StaticValue.new(2, 'Análisis')
  Electro = StaticValue.new(3, 'Electro')
  Spiro = StaticValue.new(4, 'Espiro')

  Collection = constants.map { |appointment_room| const_get(appointment_room) }
  All = Collection.map(&:id)

  def appointment_room
    AppointmentRoom::Collection.detect { |room| room.id == place_id }
  end

end
