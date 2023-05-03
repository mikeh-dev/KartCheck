class DropDummies < ActiveRecord::Migration[7.0]
  def change
    drop_table :dummies
  end
end
