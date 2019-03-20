class AccessibleStationsController < ApplicationController

   def index
      @accessible_stations = AccessibleStation.all
      render json: @accessible_stations
   end 

   def show
      @accessible_station = AccessibleStation.find_by(id: params[:id])
      render json: @accessible_station
   end 


end