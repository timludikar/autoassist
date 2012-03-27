class Article < ActiveRecord::Base
    belongs_to :user
    has_many :images
    accepts_nested_attributes_for :images, :reject_if => :all_blank
end
