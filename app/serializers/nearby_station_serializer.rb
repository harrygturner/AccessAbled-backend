class NearbyStationSerializer < ActiveModel::Serializer
  attributes :id, :attraction_id, :long, :lat, :distance, :name, :accessible_station_id
end
