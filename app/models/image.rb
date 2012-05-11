class Image < ActiveRecord::Base
  
  belongs_to :articles
  acts_as_list
  has_attached_file :photo, :styles => { :thumbnail => "302x240>", :small => "150x150>", :medium => "300x300>" }
  
  def self.thumbnail_by_id(id)
    image = find_by_id(id)
    return "no-image.jpg" if image.nil
    return image.photo.url(:thumbnail)
  end
  
  def to_jq_upload
      {
        "name" => self.photo_file_name,
        "id" => self.id,
        "size" => self.photo_file_size,
        "url" => self.photo.url(:small),
        "thumbnail_url" => self.photo.url(:thumbnail),
        "delete_url" => nil,
        "delete_type" => "DELETE" 
      }
    end
end
