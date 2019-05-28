class ApplicationController < ActionController::Base

    def index
        authorize_rspotify
    end


    def authorize_rspotify
        RSpotify.authenticate("#{ENV['CLIENT_ID']}", "#{ENV['CLIENT_SECRET']}")
    end
end
