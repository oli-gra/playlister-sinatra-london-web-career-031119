class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  include Slugify::InstanceMethods
  # extend Slugify::ClassMethods

  def self.find_by_slug(slug)
    deslug = slug.gsub!('-',' ')
    Song.find_by('lower(name) = ?', deslug)
  end



end
