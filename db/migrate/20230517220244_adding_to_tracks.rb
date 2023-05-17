class AddingToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :website, :string
    add_column :tracks, :length, :string
    add_column :tracks, :address, :string
    add_column :tracks, :phone, :string
  end
end
