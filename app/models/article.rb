class Article < ActiveRecord::Base
    belongs_to :user
    has_many :images
    accepts_nested_attributes_for :images, :reject_if => :all_blank
    
    def thumbnail
        unless self.thumbnail_id.nil? then
          @thumb = Image.find(self.thumbnail_id)
          @thumb.photo.url(:thumbnail)
        end
    end
    
end
