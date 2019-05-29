class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :current_user
    skip_before_action :authorized, only: :index
    
    def index
        authorize_rspotify
    end


    def authorize_rspotify
        RSpotify.authenticate("#{ENV['CLIENT_ID']}", "#{ENV['CLIENT_SECRET']}")
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def authorized
        redirect_to "/login" unless logged_in?
    end
end
