class Addweekcoverages < ActiveRecord::Migration
  def change
    add_column :coverages, :monday2, :text
    add_column :coverages, :tuesday2, :text
    add_column :coverages, :wednesday2, :text
    add_column :coverages, :thursday2, :text
    add_column :coverages, :friday2, :text
    add_column :coverages, :saturday2, :text
    add_column :coverages, :monday3, :text
    add_column :coverages, :tuesday3, :text
    add_column :coverages, :wednesday3, :text
    add_column :coverages, :thursday3, :text
    add_column :coverages, :friday3, :text
    add_column :coverages, :saturday3, :text
    add_column :coverages, :monday4, :text
    add_column :coverages, :tuesday4, :text
    add_column :coverages, :wednesday4, :text
    add_column :coverages, :thursday4, :text
    add_column :coverages, :friday4, :text
    add_column :coverages, :saturday4, :text
  end
end
