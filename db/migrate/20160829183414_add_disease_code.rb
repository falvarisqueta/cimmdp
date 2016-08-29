class AddDiseaseCode < ActiveRecord::Migration
  def change
    add_column :diseases, :code, :string
  end
end
