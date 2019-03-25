class LikesController < ApplicationController
   def create 
      @like = Like.new(user_id: params[:user_id], review_id: params[:review_id])
      if @like.save
         render json: @like
      else
         render json: {error: 'Need to have an account to like a review'}, status: 404
      end 
   end 
end
