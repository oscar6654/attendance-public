class Addareacode < ActiveRecord::Migration
  def change
    add_column :invoices, :area_code, :string
  end
end
