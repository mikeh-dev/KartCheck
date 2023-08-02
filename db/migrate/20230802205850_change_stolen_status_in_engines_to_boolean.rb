class ChangeStolenStatusInEnginesToBoolean < ActiveRecord::Migration[7.0]
  def change
    change_column :engines, :stolen_status, :boolean, default: false, using: 'stolen_status::boolean'
  end
end
