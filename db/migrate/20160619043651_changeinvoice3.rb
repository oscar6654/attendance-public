class Changeinvoice3 < ActiveRecord::Migration
  def change
    remove_column :invoices, :invoicenum
    add_column :invoices, :invoicenum, :string
  end
end
