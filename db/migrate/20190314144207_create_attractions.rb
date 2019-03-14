class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :about_attraction
      t.float :long
      t.float :lat
      t.boolean :dis_parking
      t.string :car_park
      t.string :accessability
      t.string :door_type
      t.string :hearing_assistance
      t.string :counter_height
      t.string :lifts
      t.string :chair_manouverability
      t.string :dis_toilets
      t.string :reduce_fees
      t.string :staff_training
      t.string :assistance_dogs
      t.boolean :braille_doc
      t.string :large_print_doc
      t.string :mob_allowed
      t.string :additional_info

      t.timestamps
    end
  end
end
