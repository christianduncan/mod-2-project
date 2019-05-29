class PlaylistsongsController < ApplicationController

    def create
        @playlist = Playlist.find(params[:id])
        @song = Song.search(params[:search])
        
        if @song
            Playlistsong.create(playlist_id: @playlist.id, song_id: @song[0].id)
            flash[:notice] = "Song Added to Playlist"
        else
            flash[:notice] = "Could not find song"
        
        end
        @songs = @playlist.songs 
        
        redirect_to playlist_path(@playlist.id)
    end


    def delete
       
        @playlistsong = Playlistsong.find(params[:id])
        @playlist = @playlistsong.playlist
        @playlistsong.delete

        redirect_to playlist_path(@playlist.id)
    end
end
