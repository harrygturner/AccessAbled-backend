class CreateNearbyStations < ActiveRecord::Migration[5.2]
  def change
    create_table :nearby_stations do |t|
      t.integer :attraction_id
      t.integer :accessible_station_id
      t.float :long
      t.float :lat
      t.integer :distance

      t.timestamps
    end
  end
end
