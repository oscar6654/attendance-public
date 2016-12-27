class AddEmployees < ActiveRecord::Migration
  def change
    
    create_table :working_hours do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
      
    end
    
    create_table :user_working_hours do |t|
      t.belongs_to :user_id
      t.belongs_to :working_hour_id
      t.date :working_date
      t.float :latitude
      t.float :longitude
    end
  end
end
