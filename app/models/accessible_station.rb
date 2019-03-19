class AccessibleStation < ApplicationRecord
   has_many :nearby_stations 
   has_many :attractions, through: :nearby_stations
   has_many :stops
end
