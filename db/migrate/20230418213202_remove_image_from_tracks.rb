class RemoveImageFromTracks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tracks, :images, :json
  end
end
