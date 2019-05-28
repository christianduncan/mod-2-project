class AddAlbumUrlToSong < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :album_url, :string
    add_column :songs, :album, :string
  end
end
