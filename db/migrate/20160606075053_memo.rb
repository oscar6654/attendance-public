class Memo < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.belongs_to :user
      t.foreign_key :users
      t.text :topic
      t.text :body
      t.timestamps
    end
  end
end
