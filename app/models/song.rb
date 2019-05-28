class Song < ApplicationRecord
    has_many :playlistsongs
    has_many :playlists, through: :playlistsongs
end
