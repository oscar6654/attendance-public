class Changedecimal < ActiveRecord::Migration
  def change
    remove_column :invoices, :invoice_amnt
    add_column :invoices, :invoice_amnt, :string
  end
end
