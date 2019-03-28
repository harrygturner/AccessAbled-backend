class AttractionsController < ApplicationController
   before_action :find_attraction, only: %i[show destroy]

   def index
      @attractions = Attraction.all
      render json: @attractions
   end 

   def show
      render json: @attraction
   end 

   def create 
      @attraction = Attraction.new(
         name: params[:name], 
         about_attraction: params[:about_attraction], 
         long: params[:long], 
         lat: params[:lat],
         dis_parking: params[:dis_parking],
         car_park: params[:car_park],
         accessibility: params[:accessibility],
         door_type: params[:door_type],
         hearing_assistance: params[:hearing_assistance],
         counter_height: params[:counter_height],
         lifts: params[:lifts],
         chair_manouverability: params[:chair_manouverability],
         dis_toilets: params[:dis_toilets],
         reduce_fees: params[:reduce_fees],
         staff_training: params[:staff_training],
         assistance_dogs: params[:assistance_dogs],
         braille_doc: params[:braille_doc],
         large_print_doc: params[:large_print_doc],
         mob_allowed: params[:mob_allowed],
         additional_info: params[:additional_info],
         address: params[:address],
         image_id: params[:image_id]
      )
      if @attraction.save 
         nearby_tubes = @attraction.nearby_tubes
         nearby_accessible_stations = []
         accessible_station_names = []
         AccessibleStation.all.each do |station|
            accessible_station_names.push(station[:name])
         end 

         nearby_tubes.each do |nearby_station|
            if accessible_station_names.include?(nearby_station[:name]) && nearby_station[:distance] < 2000
               nearby_station[:attraction_id] = @attraction.id
               accessible_station_id = AccessibleStation.find_by(name: nearby_station[:name]).id
               nearby_station[:accessible_station_id] = accessible_station_id
               nearby_accessible_stations.push(nearby_station)
            end 
         end 
         NearbyStation.create(nearby_accessible_stations)

         render json: {id: @attraction.id}
      else 
         render json: {error: 'Unable to create attraction.'}, status: 400
      end 
   end

   private 

   def find_attraction 
      @attraction = Attraction.find_by(id: params[:id])
   end 

end
