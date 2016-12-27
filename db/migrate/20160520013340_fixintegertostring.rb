class Fixintegertostring < ActiveRecord::Migration
  def change
    add_column :users, :sss_id, :string
    add_column :users, :tin_id, :string
    add_column :users, :phil_health, :string
    add_column :users, :pag_ibig_no, :string
  end
end
