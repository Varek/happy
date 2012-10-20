class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :title
      t.string :description
      t.string :url
      t.integer :provider_id
      t.timestamps
    end
  end
end
