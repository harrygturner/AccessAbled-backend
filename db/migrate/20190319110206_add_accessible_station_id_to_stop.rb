class AddAccessibleStationIdToStop < ActiveRecord::Migration[5.2]
  def change
    add_column :stops, :accessible_station_id, :integer
  end
end
