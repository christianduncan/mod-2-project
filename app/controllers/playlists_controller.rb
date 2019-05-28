class PlaylistsController < ApplicationController

    def index
        @playlists = Playlist.all
    end

    def new
        @playlist = Playlist.new
        @users = User.all
    end 

    def create
        @playlist = Playlist.create(playlist_params)

        redirect_to @playlist
    end

    def add_song
        
        @playlist = find_playlist
        @song = Song.search(params[:search])
        if @song[0]
            Playlistsong.create(playlist_id: @playlist.id, song_id: @song[0].id)
            flash[:notice] = "Song Added to Playlist"
        else
            flash[:notice] = "Could not find song"
        
        end
        @songs = @playlist.songs 

        render :show
    end

    def show
        @playlist = find_playlist
        @songs = @playlist.songs
    end



    private

    def find_playlist
        Playlist.find(params[:id])
    end

    def playlist_params
        params.require(:playlist).permit(:name, :user_id)
    end


end 
