module Role
  extend ActiveSupport::Concern

  Doctor = StaticValue.new(1, 'Doctor')
  PrincipalInvestigator = StaticValue.new(2, 'Principal Invesigator')
  SubInvestigator = StaticValue.new(3, 'Sub Investigator')
  Coordinator = StaticValue.new(4, 'Coordinator')
  Finance = StaticValue.new(5, 'Finance')

  Collection = constants.map { |role| const_get(role) }
  All = Collection.map(&:id)

  def role
    Role::Collection.detect { |r| r.id == role_id }
  end

end
