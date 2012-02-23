class Page < ActiveRecord::Base
    has_ancestry
    
    extend FriendlyId
    friendly_id :title, :use => :slugged
end
