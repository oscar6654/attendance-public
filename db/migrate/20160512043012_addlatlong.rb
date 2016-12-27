class Addlatlong < ActiveRecord::Migration
  def change
    add_column :time_records, :geolat, :float
    add_column :time_records, :geolng, :float
  end
end
