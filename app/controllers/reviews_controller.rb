class ReviewsController < ApplicationController
   def index
      @reviews = Review.all
      render json: @reviews
   end 

   def show 
      @review = Review.find(params[:id])
      render json: @review
   end 

   def create
      @review = Review.new(review_params)
      if @review.save
         render json: @review
      else
         render json: {error: 'Unable to create review.'}
      end 
   end 

   private 

   def review_params
      params.require(:review).permit(:comment, :rating)
   end

end