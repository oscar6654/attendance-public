class Addremarktoinvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :remarks, :text
  end
end
