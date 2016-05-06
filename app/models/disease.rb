class Disease < ActiveRecord::Base
  include Filterable

  validates :name, presence: true
end
