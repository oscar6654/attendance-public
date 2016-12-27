class AddWorkingHour < ActiveRecord::Migration
  def change
    add_column :working_hours, :start_time, :integer
    add_column :working_hours, :end_time, :integer
  end
end
