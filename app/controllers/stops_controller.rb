class StopsController < ApplicationController
   def index 
      @stops = Stop.all 
      render json: @stops 
   end

   def show
      @stop = Stop.find_by(id: params[:id])
      render json: @stop
   end 
end
