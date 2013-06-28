class Purchase < ActiveRecord::Base
  attr_accessible :user_id, :video_id

  belongs_to :user
  belongs_to :video

  validates_presence_of :user, :video

  after_create :send_notification_email

  def send_notification_email
    CustomerMailer.purchase_notification(self).deliver
  end
end
