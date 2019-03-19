class CreateStops < ActiveRecord::Migration[5.2]
  def change
    create_table :stops do |t|
      t.string :line
      t.integer :step_min
      t.integer :step_max
      t.integer :gap_min
      t.integer :gap_max
      t.string :level_access_by_ramp
      t.integer :platform
      t.string :direction_towards
      t.string :direction

      t.timestamps
    end
  end
end
