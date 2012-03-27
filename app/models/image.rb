class Image < ActiveRecord::Base

  belongs_to :articles
  has_attached_file :photo, :styles => { :thumbnail => "100x100>" }
end
