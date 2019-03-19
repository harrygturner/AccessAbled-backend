class CreateAccessibleStations < ActiveRecord::Migration[5.2]
  def change
    create_table :accessible_stations do |t|
      t.string :name
      t.string :accessibility_type
      t.string :lift_access
      t.string :limited_cap_lift
      t.string :additional_access_info
      t.string :bus_route_accessible

      t.timestamps
    end
  end
end
