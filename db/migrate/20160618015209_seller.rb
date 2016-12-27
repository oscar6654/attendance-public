class Seller < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.belongs_to :user
      t.foreign_key :users
      t.string :name
      t.timestamps
    end
  end
end
