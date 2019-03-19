class Attraction < ApplicationRecord
   has_many :reviews
   has_many :users, through: :reviews
   has_many :nearby_stations
   has_many :accessible_stations, through: :nearby_stations

   require 'net/http'
   require 'open-uri'
   require 'json'
   require 'nokogiri'
   require 'rexml/document'

   include REXML
   
   URL = 'http://transportapi.com/v3/uk/tube/stations/near.json?app_id=5b8791d6&app_key=394be7257ade9e582be1a6e267df783d'

   def get_nearby_tubes
      long = "&lon=#{self.long}"
      lat = "&lat=#{self.lat}"
      uri = URI.parse(URL + long + lat)
      response = Net::HTTP.get_response(uri)
      response.body
   end 

   def nearby_tubes
      tube_data = JSON.parse(self.get_nearby_tubes)
      tubes = Array.new
      tube_data['stations'].each do |station|
         tube = Hash.new
         station.each do |key, value|
            case key
            when 'name'
               tube[:name] = value
            when 'longitude'
               tube[:long] = value
            when 'latitude'
               tube[:lat] = value
            when 'distance'
               tube[:distance] = value
            end 
         end 
         tubes.push(tube)
      end 
      tubes
   end

end
