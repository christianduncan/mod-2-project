class SongsController < ApplicationController

    def index
        if params[:search]
            @songs = Song.search(params[:search])
            if !@songs
                @songs = Song.all
                flash[:notice] = "No song with that name was found"
            end
        
        else 
            @songs = Song.all
        end
    end



    def show
        @song = find_song
        @playlists = @song.playlists
    end

    


    private

    def find_song
        Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:search)
    end
end
