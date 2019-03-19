class AddNameToNearbyStation < ActiveRecord::Migration[5.2]
  def change
    add_column :nearby_stations, :name, :string
  end
end
