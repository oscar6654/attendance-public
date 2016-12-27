class Divisionregion < ActiveRecord::Migration
  def change
    add_column :users, :division, :string
    add_column :users, :region, :string
  end
end
