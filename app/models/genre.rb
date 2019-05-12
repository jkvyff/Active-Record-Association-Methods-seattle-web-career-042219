class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    Song.where(genre_id: self.id).count
  end

  def artist_count
    # return the number of artists associated with the genre
    songs = Song.where(genre_id: self.id)
    songs.map do |song|
      song.artist_id
    end.uniq.count
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    Artist.all.map do |artist|
      artist[:name]
    end.uniq
  end
end
