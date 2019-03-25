class LikeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :review_id
end
