class Playlist < ApplicationRecord
    has_many :playlistsongs
    has_many :songs, through: :playlistsongs

    belongs_to :user
end
