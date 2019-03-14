class AttractionsController < ApplicationController
   before_action :find_attraction, only: %i[show destroy]

   def index
      @attractions = Attraction.all
      render json: @attractions
   end 

   def show
      render json: @attraction
   end 

   def destroy 
      if @attraction 
         @attraction.destroy
         render json: {message: 'User deleted'}
      else 
         render json: {error: 'User not found'}, status: 404
      end 
   end 

   private 

   def find_attraction 
      @attraction = User.find(params[:id])
   end 

end