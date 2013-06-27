class Video < ActiveRecord::Base
  attr_accessible :name, :slug, :video, :preview
  has_attached_file :video
  has_attached_file :preview, formats: {
    thumb: '100x100#',
    full: '640x480#'
  }
    


  validates_presence_of :name, :slug, :publication_date, :video, :preview

  def to_param
    slug
  end
end
