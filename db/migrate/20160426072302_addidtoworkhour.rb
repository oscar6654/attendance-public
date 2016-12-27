class Addidtoworkhour < ActiveRecord::Migration
  def change
    add_column :working_hours, :user_id, :integer
    remove_column :user_working_hours, :user_id_id
    remove_column :user_working_hours, :working_hour_id_id
  end
end
