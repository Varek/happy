class CreateMomentsThings < ActiveRecord::Migration
  def change
    create_table :moments_things do |t|
      t.integer :moment_id
      t.string :thing_type
      t.integer :thing_id
      t.timestamps
    end
  end
end
