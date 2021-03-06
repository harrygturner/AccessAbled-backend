class AttractionSerializer < ActiveModel::Serializer
  attributes :id, 
    :name, 
    :about_attraction,
    :long,
    :lat,
    :dis_parking,
    :car_park,
    :accessibility,
    :door_type,
    :hearing_assistance,
    :counter_height,
    :lifts,
    :chair_manouverability,
    :dis_toilets,
    :reduce_fees,
    :staff_training,
    :assistance_dogs,
    :braille_doc,
    :large_print_doc,
    :mob_allowed,
    :additional_info,
    :address,
    :image_id
  has_many :reviews
  class ReviewSerializer < ActiveModel::Serializer
    attributes :id, :comment, :rating, :like_count, :created_at

  end
end
