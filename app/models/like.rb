class Like < ApplicationRecord
   belongs_to :user 
   belongs_to :review

   # validates :user_id, uniqueness: true
end
