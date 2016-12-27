class Finalchangesinvoice2 < ActiveRecord::Migration
  def change
    add_column :invoices, :post_status, :string
  end
end
