class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.time :opening_time
      t.time :closing_time
      t.text :overview
      t.string :website
      t.integer :length
      t.string :image

      t.timestamps
    end
  end
end
