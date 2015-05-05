class Movie < ActiveRecord::Base
  validates :videoId, uniqueness: true;
  geocoded_by :address
  after_validation :geocode
  has_many :favs
  acts_as_taggable # Alias for acts_as_taggable_on :tags

  def favorite_for(user)
    favs.find_by(user_id: user)
  end
end
