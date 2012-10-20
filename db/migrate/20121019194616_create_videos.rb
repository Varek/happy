class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.string :url
      t.string :embed_code
      t.string :thumb_url
      t.integer :provider_id
      t.timestamps
    end
  end
end
