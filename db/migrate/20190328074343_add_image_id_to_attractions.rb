class AddImageIdToAttractions < ActiveRecord::Migration[5.2]
  def change
    add_column :attractions, :image_id, :string
  end
end
