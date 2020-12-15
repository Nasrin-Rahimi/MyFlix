class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :video_url
      t.string :image_url

      t.timestamps
    end
  end
end
