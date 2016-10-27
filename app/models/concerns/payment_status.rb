module PaymentStatus
  extend ActiveSupport::Concern

  Pending = StaticValue.new(0, 'Pending')
  Payed = StaticValue.new(1, 'Payed')
  Invoiced = StaticValue.new(2, 'Invoiced')

  Collection = constants.map { |payment_status| const_get(payment_status) }
  All = Collection.map(&:id)

  def payment_status
    PaymentStatus::Collection.detect { |payment_status| payment_status.id == payment_status_id }
  end

end
