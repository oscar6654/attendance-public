class RemoveSFromRemittance < ActiveRecord::Migration
  def change
    remove_column :invoices, :total_deductions
    remove_column :invoices, :total_deductions_1
    add_column :invoices, :total_deduct, :string
    add_column :invoices, :total_deduct_1, :string
  end
end
