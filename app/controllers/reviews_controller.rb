class ReviewsController < ApplicationController
   before_action :find_review, only: %i[show increase_likes]

   def index
      @reviews = Review.all
      render json: @reviews
   end 

   def show 
      render json: @review
   end 

   def attraction_reviews
      @reviews = Review.where(attraction_id: params[:id])
      render json: @reviews
   end

   def create
      @review = Review.new(review_params)
      if @review.save
         render json: @review
      else
         render json: {error: 'Unable to create review.'}
      end 
   end 

   def increase_likes
      if @review
         @review.like_count += 1
         @review.save
         render json: @review
      else
         render json: { error: 'Image not found.' }, status: 404
      end 
   end 

   private 

   def find_review 
      @review = Review.find_by(id: params[:review_id])
   end

   def review_params
      params.require(:review).permit(:comment, :rating, :title, :attraction_id, :user_id)
   end

end