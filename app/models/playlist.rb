class Playlist < ApplicationRecord
    has_many :playlistsongs
    has_many :songs, through: :playlistsongs
end
