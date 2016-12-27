class Addpositionandstatus < ActiveRecord::Migration
  def change
     add_column :users, :position, :string
     add_column :users, :status, :string
  end
end
