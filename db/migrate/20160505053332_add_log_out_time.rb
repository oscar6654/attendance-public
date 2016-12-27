class AddLogOutTime < ActiveRecord::Migration
  def change
    add_column :user_working_hours, :logout_time, :datetime
  end
end
