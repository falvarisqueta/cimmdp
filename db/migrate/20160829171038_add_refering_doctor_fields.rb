class AddReferingDoctorFields < ActiveRecord::Migration
  def change
    add_column :doctors, :mail, :string
    add_column :doctors, :phone, :string
    add_column :doctors, :mobile, :string
    add_column :doctors, :address, :string
    add_column :doctors, :specialty, :string
    add_column :doctors, :working_days, :string
  end
end
