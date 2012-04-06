class Article < ActiveRecord::Base
    belongs_to :user
    has_many :images, :dependent => :destroy
    accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true
    
    def thumbnail
        if (self.thumbnail_id != 0) && (!self.thumbnail_id.nil?) then
          @thumb = Image.find(self.thumbnail_id)
          return @thumb.photo.url(:thumbnail)
        else
          return "no-image.jpg"
        end
    end
end
