class AddAddressToAttractions < ActiveRecord::Migration[5.2]
  def change
    add_column :attractions, :address, :string
  end
end
