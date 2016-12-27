class Coverage < ActiveRecord::Migration
  def change
    create_table :coverages do |t|
      t.belongs_to :user
      t.foreign_key :users
      t.datetime :start_time
      t.datetime :end_time
      t.text :monday
      t.text :tuesday
      t.text :wednesday
      t.text :thursday
      t.text :friday
      t.text :saturday
      t.timestamps
    end
  end
end
