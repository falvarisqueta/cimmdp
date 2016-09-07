class AddCodeToProtocol < ActiveRecord::Migration
  def change
    add_column :protocols, :code, :string
  end
end
