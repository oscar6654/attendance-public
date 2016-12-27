class Changeamnttodecimal < ActiveRecord::Migration
  def change
    remove_column :invoices, :invoice_amnt
    add_column :invoices, :invoice_amnt, :decimal
  end
end
