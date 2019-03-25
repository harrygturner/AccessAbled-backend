class User < ApplicationRecord
   has_many :reviews 
   has_many :attractions, through: :reviews
   has_many :likes 
   has_many :reviews, through: :likes

   has_secure_password
   validates :username, presence: true, uniqueness: true
   validates :email, presence: true, uniqueness: true
end
