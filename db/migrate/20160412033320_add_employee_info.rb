class AddEmployeeInfo < ActiveRecord::Migration
  def change
    add_column :users, :is_male, :boolean
    add_column :users, :birthday, :date
    add_column :users, :starting_date, :date
    add_column :users, :sss_id, :integer
    add_column :users, :tin_id, :integer
    add_column :users, :pag_ibig_no, :integer
    add_column :users, :phil_health, :integer
    add_column :users, :is_admin, :boolean
  end
end
