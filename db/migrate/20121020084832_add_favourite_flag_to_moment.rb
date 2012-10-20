class AddFavouriteFlagToMoment < ActiveRecord::Migration
  def change
    add_column :moments, :favorite, :boolean
  end
end
