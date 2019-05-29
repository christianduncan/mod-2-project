class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    
    def index
        @users = User.all 
    end

    def new 
        @user = User.new 
    end 

    #create user
    def create 
        @user = User.create(user_params)
        session[:username] = @user.username
        flash[:notice] = "Welcome!"
        redirect_to user_path(@user)

    end 


    def show
        @user = User.find(params[:id])
        @followers = @user.followers 
        @followees = @user.followees 
        @not_following = @user.not_following
        
    end



    def edit 
        @user = User.find(params[:id])
        
    end 

    def update
        @user = User.find(params[:id])
        
        @user.update(user_params)
        redirect_to user_path(@user)
    end 

    def follow
        @user = User.find(params[:id])
        
        User.find_by(user_params).followers << @user
        redirect_to user_path(@user)
    end 

    def destroy
        @user = find_user 
        @user.destroy 
        redirect_to users_path()
    end 

    private

    def find_user
        User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username)
    end 
end
