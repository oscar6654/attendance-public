class RemittanceAddBankName < ActiveRecord::Migration
  def change
    add_column :invoices, :bank_name, :string
    add_column :invoices, :bank_name_1, :string
  end
end
