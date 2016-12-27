class DeleteUserIdinWorkingHours < ActiveRecord::Migration
  def change
    remove_column :working_hours, :user_id
  end
end
