class AddSponsorAttributes < ActiveRecord::Migration
  def change
    add_column :sponsors, :monitor, :string
    add_column :sponsors, :phone, :string
    add_column :sponsors, :phone_mobile, :string
    add_column :sponsors, :email, :string
  end
end
