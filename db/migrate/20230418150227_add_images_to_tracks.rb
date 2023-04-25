class AddImagesToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :images, :json
  end
end
