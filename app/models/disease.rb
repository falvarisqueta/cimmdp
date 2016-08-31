class Disease < ActiveRecord::Base

  validates :name, presence: true
end
