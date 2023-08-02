class AddStolenStatusToChassis < ActiveRecord::Migration[7.0]
  def change
    add_column :chassis, :stolen, :boolean, default: false
  end
end
