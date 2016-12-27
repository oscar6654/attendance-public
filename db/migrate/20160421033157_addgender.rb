class Addgender < ActiveRecord::Migration
  def change
    remove_column :users, :is_male
    add_column :users, :gender, :string
  end
end
