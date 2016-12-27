class Finalinvoicechanges < ActiveRecord::Migration
  def change
    remove_column :invoices, :area_code
    change_column :invoices, :account_id, :string
    change_column :invoices, :sonumber, :string
  end
end
