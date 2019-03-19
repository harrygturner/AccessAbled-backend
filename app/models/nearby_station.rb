class NearbyStation < ApplicationRecord
   belongs_to :attraction
   belongs_to :accessible_station
end
