class CreateServiceRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :service_records, id: :uuid do |t|
      t.references :engine, null: false, foreign_key: true, type: :uuid
      t.text :description

      t.timestamps
    end

    add_column :service_records, :attachments, :json
  end
end
