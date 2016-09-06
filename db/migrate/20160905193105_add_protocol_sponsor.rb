class AddProtocolSponsor < ActiveRecord::Migration
  def change
    add_column :protocols, :sponsor_id, :integer
  end
end
