class Addforeignkey < ActiveRecord::Migration
  def change
  end
  add_foreign_key :user_working_hours, :working_hours
end
