class AccessibleStationSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :accessibility_type,
    :lift_access,
    :limited_cap_lift,
    :additional_access_info,
    :bus_route_accessible,
    :taxi_rank,
    :accessible_toilet,
    :accessible_toilet_note

  has_many :stops
  class StopSerializer < ActiveModel::Serializer
    attributes :id,
      :line,
      :step_min,
      :step_max,
      :gap_min,
      :gap_max,
      :level_access_by_ramp,
      :platform,
      :direction_towards,
      :direction
  end
end
