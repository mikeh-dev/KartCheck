class RemoveImageFromTracks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tracks, :image, :string
  end
end
