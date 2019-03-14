class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :rating, :like_count, :attraction_id, :user_id
end
