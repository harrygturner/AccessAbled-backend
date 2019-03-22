class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :rating, :like_count, :attraction_id, :user_id, :created_at, :title

  belongs_to :user
  class UserSerializer < ActiveModel::Serializer
  attributes :id, 
    :name,
    :username
  end
end

