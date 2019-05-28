


class Song < ApplicationRecord
    has_many :playlistsongs
    has_many :playlists, through: :playlistsongs

    def self.search(search)
        if search
            song = RSpotify::Track.search(search).first
            byebug
            if song
               song_result =[]
               song_result << Song.find_or_create_by(name: song.name, artist: song.artists.first.name, album_url: song.album.images[1]["url"], album: song.album.name)
            else
                Song.all
                flash[:notice] = "No song with that name was found"
            end
        else
            Song.all
        end

    end

end
