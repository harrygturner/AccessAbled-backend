class AddTaxiRankToAccessibleStation < ActiveRecord::Migration[5.2]
  def change
    add_column :accessible_stations, :taxi_rank, :string
  end
end
