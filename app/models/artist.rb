class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    #return the genre of the artist's first saved song
    Song.find_by(artist_id: self[:id]).genre
  end

  def song_count
    #return the number of songs associated with the artist
    Song.where(artist_id: self[:id]).length
  end

  def genre_count
    #return the number of genres associated with the artist
    songs = Song.where(artist_id: self[:id])
    songs.map do |song|
      song[:genre_id]
    end.uniq.length
  end
end
