class CreateChassis < ActiveRecord::Migration[7.0]
  def change
    create_table :chassis, id: :uuid do |t|
      t.string :name
      t.string :make
      t.string :model
      t.string :year
      t.string :colour
      t.text :notes
      t.string :number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
