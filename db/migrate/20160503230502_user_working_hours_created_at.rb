class UserWorkingHoursCreatedAt < ActiveRecord::Migration
  def change
    add_column :user_working_hours, :created_at, :datetime
  end
end
