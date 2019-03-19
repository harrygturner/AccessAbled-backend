class AddAccessibleToiletsAndAccessibleToiletNoteToAccessibleStation < ActiveRecord::Migration[5.2]
  def change
    add_column :accessible_stations, :accessible_toilet, :string
    add_column :accessible_stations, :accessible_toilet_note, :string
  end
end
