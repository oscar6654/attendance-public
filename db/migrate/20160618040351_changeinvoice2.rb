class Changeinvoice2 < ActiveRecord::Migration
  def change
    remove_column :invoices, :invoicenum
    add_column :invoices, :invoicenum, :integer
    add_index :invoices, :invoicenum, unique: true
  end
end
