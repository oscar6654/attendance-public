class RemitanceAdd < ActiveRecord::Migration
  def change
    add_column :invoices, :deduction_add, :boolean
    add_column :invoices, :deduction_add1, :boolean
    add_column :invoices, :deduction_add2, :boolean
    add_column :invoices, :deduction_add3, :boolean
    add_column :invoices, :deduction_add4, :boolean
    add_column :invoices, :deduction_add5, :boolean
    add_column :invoices, :deduction_add6, :boolean
    add_column :invoices, :deduction_add7, :boolean
    add_column :invoices, :other_deduction_add, :boolean
    add_column :invoices, :other_deduction_add1, :boolean
    add_column :invoices, :other_deduction_add2, :boolean
    add_column :invoices, :other_deduction_add3, :boolean
    add_column :invoices, :other_deduction_add4, :boolean
  end
end
