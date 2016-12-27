class Createinvoice3 < ActiveRecord::Migration
  def change
    add_column :invoices, :plate_no, :string
    add_column :invoices, :delivery_crew, :text
    add_column :invoices, :dispatch_datetime, :datetime
    add_column :invoices, :seal_no, :string
    add_column :invoices, :datetime_received, :datetime
    add_column :invoices, :rejection_detail, :text
  end
end
