class Users < ActiveRecord::Base
    attr_accessible :first, :last, :email
    
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :first, 
        :presence => true
    
    validates :last, 
        :presence => true
    
    validates :email, 
        :presence => true, 
        :format => { :with => email_regex }, 
        :uniqueness => true
    
end

# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  first      :string(255)
#  last       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

