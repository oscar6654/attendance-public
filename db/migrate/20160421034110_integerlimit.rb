class Integerlimit < ActiveRecord::Migration
  def change
    remove_column :users, :sss_id
    remove_column :users, :tin_id
    remove_column :users, :pag_ibig_no
    remove_column :users, :phil_health
    
    add_column :users, :sss_id, :integer, :limit => 8
    add_column :users, :tin_id, :integer, :limit => 8
    add_column :users, :pag_ibig_no, :integer, :limit => 8
    add_column :users, :phil_health, :integer, :limit => 8
  end
end
