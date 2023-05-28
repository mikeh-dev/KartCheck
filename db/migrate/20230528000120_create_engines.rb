class CreateEngines < ActiveRecord::Migration[7.0]
  def change
    create_table :engines, id: :uuid do |t|
      t.string :engine_number
      t.string :make
      t.string :model
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
