class WorkingHours < ActiveRecord::Migration
  def change
    remove_column :working_hours, :start_time
    remove_column :working_hours, :end_time
  end
end
