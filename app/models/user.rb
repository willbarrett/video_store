class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  has_secure_password

  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates_presence_of :password, on: :create

  has_many :purchases
  has_many :videos, through: :purchases

  def owns?(video)
    videos.include?(video)
  end
end
