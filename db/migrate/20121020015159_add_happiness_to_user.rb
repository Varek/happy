class AddHappinessToUser < ActiveRecord::Migration
  def change
    add_column :users, :happiness, :integer
    add_column :users, :last_happiness_reminder_at, :datetime
  end
end
