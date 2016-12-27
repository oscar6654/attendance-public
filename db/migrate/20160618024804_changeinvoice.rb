class Changeinvoice < ActiveRecord::Migration
  def change
      remove_column :invoices, :delivery_date
      add_column :invoices, :delivery_date, :date
      add_column :invoices, :invoice_created_at, :datetime
  end
end
