class Removethingsfromuser < ActiveRecord::Migration
  def change
    remove_column :users , :sss_id
    remove_column :users, :tin_id
    remove_column :users, :phil_health
    remove_column :users, :pag_ibig_no
  end
end
