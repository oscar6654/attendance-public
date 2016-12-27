class Addemployementtype < ActiveRecord::Migration
  def change
    add_column :users, :employment_type, :string
  end
end
