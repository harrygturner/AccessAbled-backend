require 'csv'

class SeedAttractions

   def self.read_csv
      array = []

      CSV.foreach('db/seed_data/seedData.csv', headers: true, encoding: 'iso-8859-1:utf-8') do |row|
         array << row
      end 
      array
   end 

   def self.make_hash_boilerplate
      nhash = {}
      array = self.read_csv
      array.each do |row|
         if row[0] == array[0][0]
            row.each do |col_name|
               nhash[col_name[0].to_sym] = nil
            end 
         end 
      end
      nhash
   end 

   def self.parse_attractions
      final_hash = []
      array = self.read_csv
      keys = self.make_hash_boilerplate.keys
      array.each do |row|
         toadd = {}
         i = 0
         while i < row.length
            toadd[keys[i]] = row[i]
            i += 1
         end 
         final_hash << toadd
      end
      final_hash
   end 

end 

class SeedAccessibleStations 

   def self.get_tube_access_data
      doc = Nokogiri::XML(open("https://tfl.gov.uk/tfl/syndication/feeds/step-free-tube-guide.xml"))
      stations = Array.new
      new_doc = doc.children.last.children
      new_doc.each do |station|
         station_hash = Hash.new(0)
         if station.name == "Station"
            station.children.each do |s_data|
               case s_data.name
               when 'StationName'
                  station_hash[:name] = s_data.content
               when 'Accessibility'
                  station_hash[:accessibility] = {}
                  station_hash[:accessibility][:lifts] = {}
                  station_hash[:accessibility][:toilets] = {}
                  station_hash[:accessibility][:specific_entrance] = {}
                  s_data.children.each do |access_data|
                     if access_data.children.length == 1
                        station_hash[:accessibility][access_data.name] = access_data.content 
                     elsif access_data.children.length > 1 
                        access_data.children.each do |more_data|
                           if more_data.name == "AccessViaLift" || more_data.name == "LimitedCapacityLift"
                              station_hash[:accessibility][:lifts][more_data.name] = more_data.content
                           elsif more_data.name == "AccessibleToilet"  || ( more_data.name == "AccessibleToiletNote" && more_data.content.length > 20 )
                              station_hash[:accessibility][:toilets][more_data.name] = more_data.content
                           end 
                        end 
                     end 
                  end 
               when 'Lines'
                  station_hash[:lines] = []
                  s_data.children.each do |line|
                     if line.name == 'Line'
                        line_hash = {}
                        line.children.each do |line_details|
                           if line_details.name != 'text' && line_details.content != ""
                              line_hash[line_details.name] = line_details.content
                           end 
                        end 
                        station_hash[:lines].push(line_hash)
                     end 
                  end
               when 'AccessibleInterchanges' 
                  station_hash[:accessible_interchange] = {}
                  s_data.children.each do |transport_type|
                     if transport_type.name == "MainBusInterchange" 
                        station_hash[:accessible_interchange][transport_type.name] = transport_type.content
                     end 
                  end 
               end
            end 
            if station_hash[:accessibility]["AccessibilityType"] != "None"
               stations.push(station_hash)
            end 
         end 
      end 
      stations
   end 

   def self.parse_stations
      stations_to_create = []
      all_accessible_stations = self.get_tube_access_data
      all_accessible_stations.each do |station|
         station_toadd = {}
         station_toadd[:name] = station[:name]
         station_toadd[:accessibility_type] = station[:accessibility]["AccessibilityType"]
         station_toadd[:lift_access] = station[:accessibility][:lifts]["AccessViaLift"]
         station_toadd[:limited_cap_lift] = station[:accessibility][:lifts]["LimitedCapacityLift"]
         station_toadd[:additional_access_info] = station[:accessibility]["AdditionalAccessibilityInformation"]
         station_toadd[:bus_route_accessible] = station[:accessible_interchange]["MainBusInterchange"]
         station_toadd[:taxi_rank] = station[:accessibility]["TaxiRanksOutsideStation"]
         station_toadd[:accessible_toilet] = station[:accessibility][:toilets]["AccessibleToilet"]
         station_toadd[:accessible_toilet_note] = station[:accessibility][:toilets]["AccessibleToiletNote"]
         stations_to_create.push(station_toadd)
      end 
      stations_to_create
   end 

end 

class SeedStopData

   def self.parse_stops
      station_data = SeedAccessibleStations.get_tube_access_data
      stops_to_create = []
      station_data.each do |station| 
         station_name = station[:name]
         station_id = AccessibleStation.all.find_by(name: station_name).id
         station[:lines].each do |stop|
            stop_toadd = {}
            stop_toadd[:accessible_station_id] = station_id
            stop_toadd[:line] = stop["LineName"]
            stop_toadd[:step_min] = stop["StepMin"]
            stop_toadd[:step_max] = stop["StepMax"]
            stop_toadd[:gap_min] = stop["GapMin"]
            stop_toadd[:gap_max] = stop["GapMax"]
            stop_toadd[:level_access_by_ramp] = stop["LevelAccessByManualRamp"]
            stop_toadd[:platform] = stop["Platform"]
            stop_toadd[:direction_towards] = stop["DirectionTowards"]
            stop_toadd[:direction] = stop["Direction"]
            stops_to_create.push(stop_toadd)
         end 
      end 
      stops_to_create
   end 

end 

class SeedNearbyStations

   def self.parse_nearest_stations
      nearby_accessible_stations = []
      accessible_stations = SeedAccessibleStations.get_tube_access_data
      accessible_station_names = []
      accessible_stations.each do |station|
         accessible_station_names.push(station[:name])
      end 
      
      Attraction.all.each do |attraction|
         attraction.nearby_tubes.each do |nearby_station|
            if attraction.name == "Harry Potter World" && nearby_station[:name] == "Watford"
               nearby_station[:name] = 'Watford Junction'
               nearby_station[:attraction_id] = attraction.id 
               accessible_station_id = AccessibleStation.find_by(name: nearby_station[:name]).id
               nearby_station[:accessible_station_id] = accessible_station_id
               nearby_accessible_stations.push(nearby_station)
            elsif attraction.name == "Kew Gardens" && ( nearby_station[:name] == "Kew Gardens" || nearby_station[:name] == "Richmond" )
               nearby_station[:attraction_id] = attraction.id 
               accessible_station_id = AccessibleStation.find_by(name: nearby_station[:name]).id
               nearby_station[:accessible_station_id] = accessible_station_id
               nearby_accessible_stations.push(nearby_station)
            elsif accessible_station_names.include?(nearby_station[:name]) && nearby_station[:distance] < 2000
               nearby_station[:attraction_id] = attraction.id 
               accessible_station_id = AccessibleStation.find_by(name: nearby_station[:name]).id
               nearby_station[:accessible_station_id] = accessible_station_id
               nearby_accessible_stations.push(nearby_station)
            end 
         end 
      end 
      nearby_accessible_stations
   end 
   
end 