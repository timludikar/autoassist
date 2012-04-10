class Image < ActiveRecord::Base
  
  belongs_to :articles
  acts_as_list
  has_attached_file :photo, :styles => { :thumbnail => "302x240>", :small => "150x150>", :medium => "300x300>" }
  
  def self.thumbnail_by_id(id)
    image = find_by_id(id)
    return "no-image.jpg" if image.nil
    return image.photo.url(:thumbnail)
  end
end
