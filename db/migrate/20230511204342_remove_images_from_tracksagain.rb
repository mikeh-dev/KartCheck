class RemoveImagesFromTracksagain < ActiveRecord::Migration[7.0]
  def change
    remove_column :tracks, :images
  end
end
