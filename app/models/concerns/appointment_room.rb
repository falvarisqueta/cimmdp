module AppointmentRoom
  extend ActiveSupport::Concern

  Consulting31 = StaticValue.new(1, 'Piso 1 - Consultorio 3')
  Consulting41 = StaticValue.new(2, 'Piso 1 - Consultorio 4')
  Consulting51 = StaticValue.new(3, 'Piso 1 - Consultorio 5')
  Consulting25 = StaticValue.new(4, 'Piso 5 - Consultorio 2')
  Consulting35 = StaticValue.new(5, 'Piso 5 - Consultorio 3')
  Analysis = StaticValue.new(6, 'Análisis')
  Electro = StaticValue.new(7, 'Electro')
  Spiro = StaticValue.new(8, 'Espiro')

  Collection = constants.map { |appointment_room| const_get(appointment_room) }
  All = Collection.map(&:id)

  def appointment_room
    AppointmentRoom::Collection.detect { |room| room.id == place_id }
  end

end
