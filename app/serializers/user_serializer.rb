class UserSerializer < ActiveModel::Serializer
  attributes :id, 
    :name,
    :username,
    :email,
    :password_digest
  has_many :reviews
  class ReviewSerializer < ActiveModel::Serializer
    attributes :id, :comment, :rating, :like_count
  end
end
