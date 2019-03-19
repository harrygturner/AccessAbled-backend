class NearbyStationsController < ApplicationController
   def index 
      @nearby_stations = NearbyStation.all 
      render json: @nearby_stations 
   end

   # def show
   #    @nearby_station = NearbyStation.find_by(id: params[:id])
   #    render json: @nearby_station
   # end 

   def attraction_stations
      @stations = NearbyStation.where(attraction_id: params[:id])
      render json: @stations
   end 
end
