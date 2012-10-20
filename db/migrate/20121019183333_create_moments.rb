class CreateMoments < ActiveRecord::Migration
  def change
    create_table :moments do |t|
      t.text :content
      t.string :url
      t.integer :user_id
      t.timestamps
    end
  end
end
