# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Attraction.destroy_all
AccessibleStation.destroy_all
Stop.destroy_all
NearbyStation.destroy_all

require_relative 'seed_data/seed_controller.rb'

Attraction.create(SeedAttractions.parse_attractions)
AccessibleStation.create(SeedAccessibleStations.parse_stations)
Stop.create(SeedStopData.parse_stops)
NearbyStation.create(SeedNearbyStations.parse_nearest_stations)