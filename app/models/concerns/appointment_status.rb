module AppointmentStatus
  extend ActiveSupport::Concern

  Pending = StaticValue.new(1, 'Pending')
  InProgress = StaticValue.new(2, 'In Progress')
  Completed = StaticValue.new(3, 'Completed')
  NotAttended = StaticValue.new(4, 'Did not Attend')

  Collection = constants.map { |appointment_status| const_get(appointment_status) }
  Occur = [InProgress.id, Completed.id]
  All = Collection.map(&:id)

  def appointment_status
    AppointmentStatus::Collection.detect { |appointment_status| appointment_status.id == appointment_status_id }
  end

end
