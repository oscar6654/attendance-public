class Adduserworkid < ActiveRecord::Migration
  def change
    add_column :user_working_hours, :user_id, :integer
    add_column :user_working_hours, :working_hour_id, :integer
  end
end
