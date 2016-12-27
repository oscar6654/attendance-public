class RemittanceSecond < ActiveRecord::Migration
  def change
    add_column :invoices, :post_payment_status, :string
  end
end
