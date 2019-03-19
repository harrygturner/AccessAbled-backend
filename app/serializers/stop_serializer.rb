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
    :direction,
    :accessible_station_id
end
