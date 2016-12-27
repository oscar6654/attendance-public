class Invoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.belongs_to :user
      t.foreign_key :users
      t.string :whlocation
      t.string :segment
      t.string :sellername
      t.integer :invoicenum
      t.integer :sonumber
      t.integer :account_id
      t.string :account_name
      t.integer :case_qty
      t.integer :item_qty
      t.integer :invoice_amnt, :limit => 8
      t.datetime :delivery_date
      t.string :delivery_status
    end
  end
end
