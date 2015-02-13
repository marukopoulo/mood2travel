class Movie < ActiveRecord::Base
  validates :videoId, uniqueness: true;
  geocoded_by :address
  after_validation :geocode
  has_many :favs

  def favorite_for(user)
    favs.find_by(user_id: user)
  end
end
