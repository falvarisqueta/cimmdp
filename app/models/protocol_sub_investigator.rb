class ProtocolSubInvestigator < ActiveRecord::Base
  belongs_to :protocol
  belongs_to :user
end
