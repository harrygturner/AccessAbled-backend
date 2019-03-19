class UsersController < ApplicationController
   before_action :find_user, only: %i[show update destroy]

   def index
      @users = User.all
      render json: @users
   end 

   def show
      render json: @user
   end 

   def create 
      @user = User.new(user_params)
      if @user.save 
         render json: @user 
      else 
         render json: {error: 'Unable to create user.'}, status: 400
      end 
   end 

   def update
      if @user
         @user.update(name: params[:name], username: params[:username])
         render json: @user
      else
         render json: {error: 'User not found.'}, status: 404
      end 
   end 

   def destroy 
      if @user 
         @user.destroy
         render json: {message: 'User deleted'}
      else 
         render json: {error: 'User not found'}, status: 404
      end
   end 

   private 

   def find_user 
      @user = User.find(params[:id])
   end 

   def user_params
      params.require(:user).permit(:name, :username, :password, :email)
   end

end