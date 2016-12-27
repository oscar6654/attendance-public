class Geolocout < ActiveRecord::Migration
  def change
    add_column :time_records, :geolatout, :float
    add_column :time_records, :geolngout, :float
  end
end
