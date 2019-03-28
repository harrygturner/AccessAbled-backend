# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Attraction.destroy_all
AccessibleStation.destroy_all
Stop.destroy_all
NearbyStation.destroy_all

require_relative 'seed_data/seed_controller.rb'

Attraction.create(SeedAttractions.parse_attractions)
AccessibleStation.create(SeedAccessibleStations.parse_stations)
Stop.create(SeedStopData.parse_stops)
NearbyStation.create(SeedNearbyStations.parse_nearest_stations)

10.times do 
   name = Faker::Name.name
   User.create({name: name, username: Faker::Internet.username(5..8) , password: name.split(' ')[0], email: Faker::Internet.email(name) })
end 

n = 1
while n <= 18
   i = 1
   10.times do 
      Review.create({comment: Faker::Quote.famous_last_words, rating: Random.rand(1...6), user_id: i, attraction_id: n, title: Faker::Book.title})
      i += 1
   end 
   n += 1
end

