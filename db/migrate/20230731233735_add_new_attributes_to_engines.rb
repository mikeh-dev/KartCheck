class AddNewAttributesToEngines < ActiveRecord::Migration[7.0]
  def change
    add_column :engines, :current_seal, :string
    add_column :engines, :stolen_status, :string
    add_column :engines, :barrel_number, :string
    add_column :engines, :year, :string
  end
end
