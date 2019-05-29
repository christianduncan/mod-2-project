class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]

    def new
        # nothing to do here!
        @user = User.new
       
    end
 
    def create
        
        @user = User.find_by(username: params[:user][:username])
        
        if @user
            session[:user_id] = @user.id
            flash[:notice] = "Welcome Back!"
            redirect_to '/'
        else
            flash[:notice]= "Unknown User or Password"
            @user = User.new
            render :new
        end
    end

    def destroy
        session.delete :user_id

        redirect_to "/login"
      end
end