class Decimalamnt2 < ActiveRecord::Migration
  def change
    remove_column :invoices, :invoice_amnt
    add_column :invoices, :invoice_amnt, :decimal, :precision => 12, :scale => 2
  end
end
