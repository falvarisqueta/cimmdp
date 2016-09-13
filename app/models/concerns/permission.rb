module Permission
  extend ActiveSupport::Concern

  Admin = StaticValue.new(1, 'Admin')
  Finance = StaticValue.new(2, 'Finance')
  Doctor = StaticValue.new(3, 'Doctor')

  Collection = constants.map { |permission| const_get(permission) }
  All = Collection.map(&:id)

  def permission
    Permission::Collection.detect { |permission| permission.id == permission_id }
  end

end
