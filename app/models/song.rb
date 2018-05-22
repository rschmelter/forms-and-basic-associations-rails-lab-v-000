require 'pry'

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
    unless self.artist == nil
      self.artist.name
    end
  end

  def note_contents=(array)
    array.each do |content|
      self.notes.build(content: content) unless content == " "
    end
  end

  def note_contents
    contents = []
    self.notes.each do |content|
      contents << content.content
    end
    contents
    # binding.pry
  end

end
