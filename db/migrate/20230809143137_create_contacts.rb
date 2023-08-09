class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :email
      t.string :phone_number
      t.text :message
      
      t.timestamps
    end
  end
end
