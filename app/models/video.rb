class Video < ActiveRecord::Base
  attr_accessible :name, :slug, :video, :preview, :publication_date, :price, :price_cents
  has_attached_file :video
  has_attached_file :preview, formats: {
    thumb: '100x100#',
    full: '640x480#'
  }

  validates_presence_of :name, :slug, :publication_date, :video, :preview, :price

  monetize :price_cents

  has_many :purchases

  def to_param
    slug
  end
end
