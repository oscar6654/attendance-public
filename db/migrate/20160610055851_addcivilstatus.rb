class Addcivilstatus < ActiveRecord::Migration
  def change
    add_column :users, :civil_status, :string
  end
end
