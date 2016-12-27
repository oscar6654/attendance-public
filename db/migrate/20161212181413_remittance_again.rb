class RemittanceAgain < ActiveRecord::Migration
  def change
      add_column :invoices, :remittance_date_1, :datetime
      add_column :invoices, :payment_mode_1, :string
      add_column :invoices, :payment_amnt_1, :string
      add_column :invoices, :payment_days_1, :datetime
      add_column :invoices, :check_no_1, :string
      add_column :invoices, :check_date_1, :date
      add_column :invoices, :total_deductions_1, :string
      add_column :invoices, :desc_deduction_1, :string
      add_column :invoices, :deduction_reference_1, :string
      add_column :invoices, :decution_amnt_1, :string
      add_column :invoices, :desc_deduction1_1, :string
      add_column :invoices, :deduction_reference1_1, :string
      add_column :invoices, :decution_amnt1_1, :string
      add_column :invoices, :desc_deduction2_1, :string
      add_column :invoices, :deduction_reference2_1, :string
      add_column :invoices, :decution_amnt2_1, :string
      add_column :invoices, :deduction_add_1, :boolean
      add_column :invoices, :deduction_add1_1, :boolean
      add_column :invoices, :deduction_add2_1, :boolean
      add_column :invoices, :other_desc_deduction_1, :string
      add_column :invoices, :other_deduction_reference_1, :string
      add_column :invoices, :other_decution_amnt_1, :string
      add_column :invoices, :other_deduction_add_1, :boolean
      add_column :invoices, :deduction_sum_1, :string
      add_column :invoices, :other_deduction_sum_1, :string
      add_column :invoices, :balance_to_close_1, :string
      add_column :invoices, :short_over_1, :string
      add_column :invoices, :post_payment_status_1, :string
  end
end
