class RemoveVideoUrlFromVideos < ActiveRecord::Migration[6.0]
  def change
    remove_column :videos, :video_url, :string
  end
end
