class UsersController < ApplicationController

    def index
        @users = User.all 
    end

    def new 
        @user = User.new 
    end 

    #create user
    def create 
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            flash.now[:notice] = 'User Successfully Created'
            redirect_to user_path(@user)
        else
            flash.now[:notice] = @user.full_messages[0]
            render :new 
        end 
    end 


    def show
        @user = find_user
    end

    def edit 
        @user = find_user
    end 

    def update 
        @user = find_user 
        @user.update(user_params)
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
