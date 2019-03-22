class UsersController < ApplicationController
   before_action :find_user, only: %i[show update destroy]

   def index
      @users = User.all
      render json: @users
   end 

   def show
      render json: @user
   end 

   def login 
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
         render json: {username: @user.username, token: issue_token({id: @user.id}), id: @user.id}
      else 
         render json: {error: 'Username/password combination invalid.'}, status: 401
      end 
   end 

   def validate 
      @user = get_current_user
      if @user 
         render json: {token: issue_token({id: @user.id}), id: @user.id, username: @user.username}
      else
         render json: {error: 'Username/password combination invalid.'}, status: 401
      end 
   end 

   def create 
      @user = User.new(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
      if @user.save 
         render json: {username: @user.username, token: issue_token({id: @user.id}), id: @user.id}
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

end