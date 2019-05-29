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

    

    def edit
        @playlist = find_playlist
        @users = User.all

    end

    def update
        @playlist = find_playlist
        @playlist.update(playlist_params)

        redirect_to @playlist

    end

    def destroy
        @playlist = find_playlist
        @playlist.destroy

        redirect_to playlists_path
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
