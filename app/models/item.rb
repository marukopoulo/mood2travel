class Item < ActiveRecord::Base
  mount_uploader :video, VideoUploader
  validates :video , :place, :time, :walker, :director, :presence => true;
end
