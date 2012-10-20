class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :description
      t.string :url
      t.string :photo_url
      t.string :thumb_url
      t.integer :provider_id
      t.timestamps
    end
  end
end
