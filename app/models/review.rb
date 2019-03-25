class Review < ApplicationRecord
   belongs_to :user
   belongs_to :attraction
   has_many :likes
   has_many :users, through: :likes
end
