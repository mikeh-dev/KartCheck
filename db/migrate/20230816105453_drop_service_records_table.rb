class DropServiceRecordsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :service_records
  end
end
