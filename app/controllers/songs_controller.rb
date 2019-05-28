class SongsController < ApplicationController

    def index
    
        @songs = Song.search(params[:search])
        

    end



    def show
        @song = find_song
    end

    


    private

    def find_song
        Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:name, :artist, :search)
    end
end
