class PunchInOut < ActiveRecord::Migration
  def change
    create_table :time_records do |t|
      t.belongs_to :user
      t.foreign_key :users
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
