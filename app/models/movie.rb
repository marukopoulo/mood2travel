class Movie < ActiveRecord::Base
  validates :videoId, uniqueness: true;
end
