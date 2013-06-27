class Purchase < ActiveRecord::Base
  attr_accessible :user_id, :video_id

  belongs_to :user
  belongs_to :video

  validates_presence_of :user, :video
end
